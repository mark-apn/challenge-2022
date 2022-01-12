import 'dart:io';

import 'package:dart_appwrite/dart_appwrite.dart';

void main(List<String> args) {
  final envVars = Platform.environment;
  final client = Client();

  client
      .setEndpoint(envVars['ENDPOINT']!)
      .setProject(envVars['APPWRITE_FUNCTION_PROJECT_ID'])
      .setKey(envVars['API_KEY']);

  final storage = Storage(client);
  final future = storage.listFiles();

  future.then((response) {
    print('${response.sum} file(s) found on storage');
    print(response.files.first.name);
    exit(0);
  }, onError: (error) {
    print(error);
    exit(0);
  });
}
