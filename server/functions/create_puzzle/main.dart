import 'dart:io';

import 'package:uuid/uuid.dart';

import 'client.dart';

void main(List<String> args) async {
  final envVars = Platform.environment;

  final client = ClientIO()
      .setEndpoint(envVars['ENDPOINT']!)
      .setProject(envVars['APPWRITE_FUNCTION_PROJECT_ID'])
      .setKey(envVars['API_KEY']);

  final String path = '/database/collections/61e04362224a95ee814b/documents';

  final Map<String, dynamic> params = {
    'documentId': Uuid().v4(),
    'data': {
      'created_at': DateTime.now().millisecondsSinceEpoch,
      'status': 'incomplete',
      'tile_order': [3, 4, 5, 0, 1, 2, 6, 7, 8],
      'num_tiles': 9,
      'num_moves': 0,
      'num_votes': 0,
    },
    'read': ["role:all"],
    'write': null,
  };

  final Map<String, String> headers = {
    'content-type': 'application/json',
  };

  final res = await client.call(
    HttpMethod.post,
    path: path,
    params: params,
    headers: headers,
  );

  print(res);

  // final result = await database.createDocument(
  //   collectionId: '61e04362224a95ee814b',
  //   documentId: documentId,
  //   read: ,
  //   data: ,
  // );

  // print(result.toMap());
}
