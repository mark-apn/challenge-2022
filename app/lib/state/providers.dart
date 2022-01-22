
import 'package:flutter/material.dart';
import 'package:flutter_challenge/grpc/client.dart';
import 'package:flutter_challenge/state/puzzle_state.dart';
import 'package:flutter_challenge/utils/image_tiler.dart';
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

  return ref.watch(_remotePuzzleProvider).map(
        data: _mapData,
        error: _mapError,
        loading: (_) => _mapLoading(),
      );
});

// Image tiler that listens to the puzzle dimensions
final tiledImagesProvider = FutureProvider.autoDispose((ref) async {
  final dimensions = ref.watch(puzzleDimensionsProvider);

  final uiImage = Image.asset('assets/img/dashing_dashes.png');
  return ImageTiler(
    rows: dimensions,
    columns: dimensions,
  ).tile(uiImage);
});

// Call the server and get updates on the current active puzzle
final _remotePuzzleProvider = StreamProvider.autoDispose((ref) {
  return GrpcClient.instance.subscribeToPuzzle();
});

final puzzleDimensionsProvider = Provider.autoDispose((ref) {
  return ref.watch(puzzleProvider.select((value) => value.puzzle.getDimension()));
});
