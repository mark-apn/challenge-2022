import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/state/puzzle_viewmodel.dart';
import 'package:flutter_challenge/utils/image_tiler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'puzzle_state.dart';

// Inital puzzle state
final puzzleProvider = StateProvider((_) => PuzzleState.initial(3));

// Provides the viewmodel that is in charge of changing the puzzle state
final puzzleViewModel = Provider((ref) => PuzzleViewModel(ref.read));

final imagesProvider = FutureProvider((ref) async {
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
