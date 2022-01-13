import 'dart:io';

import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:uuid/uuid.dart';

void main(List<String> args) async {
  final envVars = Platform.environment;
  final client = Client()
      .setEndpoint(envVars['ENDPOINT']!)
      .setProject(envVars['APPWRITE_FUNCTION_PROJECT_ID'])
      .setKey(envVars['API_KEY']);

  final database = Database(client);

  final documentId = Uuid().v4();
  final result = await database.createDocument(
    collectionId: '[COLLECTION_ID]',
    documentId: documentId,
    read: ["*"],
    data: {
      'created_at': DateTime.now().toIso8601String(),
      'status': 'incomplete',
      'tiles': [],
      'num_correct': 0,
      'num_moves': 0,
    },
  );

  print(result);
}
