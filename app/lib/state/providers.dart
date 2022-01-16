import 'dart:async';

import 'package:flutter_challenge/client.dart';
import 'package:flutter_challenge/state/puzzle_state.dart';
import 'package:flutter_challenge/state/puzzle_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

// Inital puzzle state
final puzzleProvider = StateProvider.autoDispose((ref) {
  // * Convert data to state
  PuzzleState _mapData(AsyncData<Puzzle> puzzle) {
    return PuzzleState(
      puzzle: puzzle.value,
    );
  }

  // * Convert error to state
  PuzzleState _mapError(AsyncError error) {
    return PuzzleState(
      puzzle: Puzzle.empty(),
      error: error.error,
    );
  }

  // * Convert loading to state
  PuzzleState _mapLoading() {
    return PuzzleState(
      puzzle: Puzzle.empty(),
      isLoading: true,
    );
  }

  return ref.watch(remotePuzzleProvider).map(
        data: _mapData,
        error: _mapError,
        loading: (_) => _mapLoading(),
      );
});

// Provides the viewmodel that is in charge of changing the puzzle state
final puzzleVM = Provider((ref) => PuzzleViewModel(ref.read));

// Call the server and get updates on the current active puzzle
final remotePuzzleProvider = StreamProvider.autoDispose((ref) {
  final client = GrpcClient.instance;

  // * Send keep alive every 5 seconds
  final timer = Timer.periodic(
    const Duration(seconds: 5),
    (_) => client.sendKeepAliveSignal(),
  );

  ref.onDispose(() {
    timer.cancel();
    client.close();
  });

  return client.subscribeToPuzzle();
});
