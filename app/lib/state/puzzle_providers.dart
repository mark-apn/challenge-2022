import 'dart:ui';

import 'package:flutter/material.dart' hide ImageCache;
import 'package:flutter_challenge/grpc/client.dart';
import 'package:flutter_challenge/state/puzzle_state.dart';
import 'package:flutter_challenge/utils/image_cache.dart';
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
    debugPrint(error.error.toString());
    debugPrint(error.stackTrace?.toString() ?? 'no stacktrace');
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

// Image tiler that listens to the puzzle dimensions
// Tiles the given image into a grid of the given dimensions
// Saves the individual tiles to the given path
final tileImagesProvider = FutureProvider.autoDispose((ref) async {
  final dimensions = ref.watch(puzzleDimensionsProvider);

  final uiImage = Image.asset('assets/img/dashing_dashes.png');
  final tiles = await ImageTiler(
    rows: dimensions,
    columns: dimensions,
  ).tile(uiImage).onError((error, stackTrace) {
    print(error.toString());
    print(stackTrace.toString());

    return [];
  });

  int i = 0;
  final cache = ImageCache.instance;
  for (final image in tiles) {
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final uint8List = byteData?.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

    cache.store(i, uint8List);
    i++;
  }
});

/// Used to get 1 of the tiles from the tile cache
final imageForTileByValueProvider = Provider.autoDispose.family<Image?, int>((ref, value) {
  // Tile value is 1 based, cache 0 based so subtract 1 from given value
  final imageData = ImageCache.instance.get(value - 1);

  if (imageData != null) {
    return Image.memory(imageData);
  } else {
    return null;
  }
});

// Call the server and get updates on the current active puzzle
final remotePuzzleProvider = StreamProvider.autoDispose((ref) {
  return GrpcClient.instance.subscribeToPuzzle();
});

// Updates all listeners when the puzzle dimensions change
final puzzleDimensionsProvider = Provider.autoDispose((ref) {
  return ref.watch(puzzleProvider.select((value) => value.puzzle.getDimension()));
});
