import 'package:flutter_challenge/client.dart';
import 'package:flutter_challenge/state/puzzle_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'puzzle_state.dart';

// Inital puzzle state
final puzzleProvider = StateProvider((_) => PuzzleState.initial(3));

// Provides the viewmodel that is in charge of changing the puzzle state
final puzzleViewModel = Provider((ref) => PuzzleViewModel(ref.read));

// Call the server and get updates on the current active puzzle
final remotePuzzleProvider = StreamProvider.autoDispose((ref) {
  final client = GrpcClient();

  ref.onDispose(client.close);

  return client.subscribeToPuzzle();
});
