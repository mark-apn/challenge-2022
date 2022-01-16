import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/client.dart';
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

final tiledImagesProvider = FutureProvider.autoDispose((ref) async {
  final dimensions = ref.watch(puzzleProvider.select((state) => state.puzzle.getDimension()));
  final completer = Completer<List<Image>>();

  final uiImage = Image.asset('assets/img/dashing_dashes.png');
  final imageTiler = ImageTiler(dimensions, dimensions);

  final config = uiImage.image.resolve(const ImageConfiguration());
  config.addListener(ImageStreamListener(
    (ImageInfo info, __) {
      imageTiler.image = info.image;

      imageTiler.getTiles().then((tiles) {
        completer.complete(tiles);
      });
    },
    onError: completer.completeError,
  ));

  return completer.future;
});

// Call the server and get updates on the current active puzzle
final _remotePuzzleProvider = StreamProvider.autoDispose((ref) {
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
