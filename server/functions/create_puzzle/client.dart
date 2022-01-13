import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class ClientIO {
  String _endPoint;
  Map<String, String>? _headers;
  late Map<String, String> config;
  bool _initialized = false;
  late http.Client _httpClient;
  late HttpClient _nativeClient;

  ClientIO({
    String endPoint = 'https://HOSTNAME/v1',
    bool selfSigned = false,
  }) : _endPoint = endPoint {
    _nativeClient = new HttpClient()
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) => selfSigned);
    _httpClient = new IOClient(_nativeClient);
    this._endPoint = endPoint;
    this._headers = {
      'content-type': 'application/json',
      'x-sdk-version': 'appwrite:dart:3.0.2',
      'X-Appwrite-Response-Format': '0.12.0',
    };

    this.config = {};

    assert(_endPoint.startsWith(RegExp("http://|https://")), "endPoint $_endPoint must start with 'http'");
  }

  String get endPoint => _endPoint;

  /// Your project ID
  ClientIO setProject(value) {
    config['project'] = value;
    addHeader('X-Appwrite-Project', value);
    return this;
  }

  /// Your secret API key
  ClientIO setKey(value) {
    config['key'] = value;
    addHeader('X-Appwrite-Key', value);
    return this;
  }

  /// Your secret JSON Web Token
  ClientIO setJWT(value) {
    config['jWT'] = value;
    addHeader('X-Appwrite-JWT', value);
    return this;
  }

  ClientIO setLocale(value) {
    config['locale'] = value;
    addHeader('X-Appwrite-Locale', value);
    return this;
  }

  ClientIO setSelfSigned({bool status = true}) {
    _nativeClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => status);
    return this;
  }

  ClientIO setEndpoint(String endPoint) {
    this._endPoint = endPoint;
    return this;
  }

  ClientIO addHeader(String key, String value) {
    _headers![key] = value;
    return this;
  }

  Future<Response> call(
    HttpMethod method, {
    String path = '',
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
    ResponseType? responseType,
  }) async {
    late http.Response res;
    http.BaseRequest request = this.prepareRequest(
      method,
      uri: Uri.parse(_endPoint + path),
      headers: {...this._headers!, ...headers},
      params: params,
    );

    final streamedResponse = await _httpClient.send(request);
    res = await toResponse(streamedResponse);
    return this.prepareResponse(
      res,
      responseType: responseType,
    );
  }

  http.BaseRequest prepareRequest(
    HttpMethod method, {
    required Uri uri,
    required Map<String, String> headers,
    required Map<String, dynamic> params,
  }) {
    if (params.isNotEmpty) {
      params.removeWhere((key, value) => value == null);
    }

    http.BaseRequest request = http.Request(method.name(), uri);
    if (headers['content-type'] == 'multipart/form-data') {
      request = http.MultipartRequest(method.name(), uri);
      if (params.isNotEmpty) {
        params.forEach((key, value) {
          if (value is http.MultipartFile) {
            (request as http.MultipartRequest).files.add(value);
          } else {
            if (value is List) {
              value.asMap().forEach((i, v) {
                (request as http.MultipartRequest).fields.addAll({"$key[$i]": v.toString()});
              });
            } else {
              (request as http.MultipartRequest).fields.addAll({key: value.toString()});
            }
          }
        });
      }
    } else if (method == HttpMethod.get) {
      final encoded = <String, dynamic>{};
      if (params.isNotEmpty) {
        params.keys.forEach((key) {
          if (params[key] is int || params[key] is double) {
            encoded[key] = params[key].toString();
          } else if (params[key] is List) {
            encoded[key + "[]"] = params[key];
          } else {
            encoded[key] = params[key];
          }
        });
      }
      uri = Uri(
          fragment: uri.fragment,
          path: uri.path,
          host: uri.host,
          scheme: uri.scheme,
          queryParameters: encoded,
          port: uri.port);
      request = http.Request(method.name(), uri);
    } else {
      (request as http.Request).body = jsonEncode(params);
    }

    request.headers.addAll(headers);
    return request;
  }

  Response prepareResponse(http.Response res, {ResponseType? responseType}) {
    if (responseType == null) {
      responseType = ResponseType.json;
    }
    if (res.statusCode >= 400) {
      if ((res.headers['content-type'] ?? '').contains('application/json')) {
        throw json.decode(res.body);
      } else {
        throw res.body;
      }
    }
    var data;
    if ((res.headers['content-type'] ?? '').contains('application/json')) {
      if (responseType == ResponseType.json) {
        data = json.decode(res.body);
      } else if (responseType == ResponseType.bytes) {
        data = res.bodyBytes;
      } else {
        data = res.body;
      }
    } else {
      if (responseType == ResponseType.bytes) {
        data = res.bodyBytes;
      } else {
        data = res.body;
      }
    }
    return Response(data: data);
  }

  Future<http.Response> toResponse(http.StreamedResponse streamedResponse) async {
    if (streamedResponse.statusCode == 204) {
      return new http.Response(
        '',
        streamedResponse.statusCode,
        headers: streamedResponse.headers
            .map((k, v) => k.toLowerCase() == 'content-type' ? MapEntry(k, 'text/plain') : MapEntry(k, v)),
        request: streamedResponse.request,
        isRedirect: streamedResponse.isRedirect,
        persistentConnection: streamedResponse.persistentConnection,
        reasonPhrase: streamedResponse.reasonPhrase,
      );
    } else {
      return await http.Response.fromStream(streamedResponse);
    }
  }
}

enum HttpMethod { get, post, put, delete, patch }

extension HttpMethodString on HttpMethod {
  String name() {
    return this.toString().split('.').last.toUpperCase();
  }
}

enum ResponseType {
  /// Transform the response data to JSON object only when the
  /// content-type of response is "application/json" .
  json,

  /// Transform the response data to a String encoded with UTF8.
  plain,

  /// Get original bytes, the type of response will be List<int>
  bytes
}

class Response<T> {
  Response({this.data});

  T? data;

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}
