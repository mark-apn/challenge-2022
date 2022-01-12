import 'dart:io';

import 'package:dart_appwrite/dart_appwrite.dart';

void main(List<String> args) {
  Map<String, String> envVars = Platform.environment;

  print('Hello world from function build and uploaded via CI!');

  final client = Client();

  client
      .setEndpoint("http://appwrite.flutterdev.com/v1")
      .setProject(envVars['APPWRITE_FUNCTION_PROJECT_ID'] ?? "61de8894b51533df20ce")
      .setKey(
          "5f3b3c5e8f72dff0f77fe550ab2372b259d8705c06fb530d0420e50f2b03825e0823b453d5a2dd9566fab2147d2f32f41206665c38ea291451b34cfb4c93d671f932f55fe55caa12db1df7c76e66661a502cb2667fffbd59ba6952b9e05b46951d1c56fdc24df18f16e6cd42a3c651b7f21071fdfdf059cfcb225eeac75134d9");

  // Initialise the storage SDK
  final storage = new Storage(client);
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
