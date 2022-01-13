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
    collectionId: '61e04362224a95ee814b',
    documentId: documentId,
    read: ["role:all"],
    data: {
      'created_at': DateTime.now().millisecondsSinceEpoch,
      'status': 'incomplete',
      'tile_order': [3, 4, 5, 0, 1, 2, 6, 7, 8],
      'num_tiles': 9,
      'num_moves': 0,
      'num_votes': 0,
    },
  );

  print(result.toMap());
}
