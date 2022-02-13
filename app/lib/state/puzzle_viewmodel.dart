import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/extensions.dart';
import 'package:flutter_challenge/grpc/client.dart';
import 'package:flutter_challenge/state/konami_state.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_challenge/utils/tile_finder.dart';
import 'package:flutter_challenge/utils/tracker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared/shared.dart';

class PuzzleVm {
  static final PuzzleVm instance = PuzzleVm._internal();

  PuzzleVm._internal();

  Future<void> puzzleCompleted() async {
    _log('puzzle completed');
    Tracker.trackEvent('puzzle_completed');
    GrpcClient.instance.subscribeToPuzzle();
  }

  // * Send vote to server via client
  Future<void> tileTapped(Tile tappedTile) async {
    _log('vote');
    Tracker.trackEvent('vote');
    await GrpcClient.instance.voteOnTile(tappedTile.value);
  }

  Future<void> updatePointerPosition(Offset position) async {
    _log('updatePointerPosition');
    GrpcClient.instance.updatePointerPosition(position.dx, position.dy);
  }

  Future<void> updatePointerSettings({required PointerDisplaySettings settings}) async {
    _log('updatePointerSettings');
    Tracker.trackEvent('update_pointer_settings');
    GrpcClient.instance.updatePointerSettings(settings);
  }

  void _log(String message) {
    debugPrint('${DateFormat.Hms().format(DateTime.now())} PuzzleVM: $message');
  }

  void onKeyPressed(Reader read, LogicalKeyboardKey key) {
    final Tile? tileToTap;
    final tiles = read(puzzleProvider).puzzle.tiles;
    final finder = TileFinder(tiles);

    if (key == LogicalKeyboardKey.arrowDown) {
      tileToTap = finder.votableAboveWhitespace();
    } else if (key == LogicalKeyboardKey.arrowUp) {
      tileToTap = finder.votableBelowWhitespace();
    } else if (key == LogicalKeyboardKey.arrowLeft) {
      tileToTap = finder.votableRightFromWhitespace();
    } else if (key == LogicalKeyboardKey.arrowRight) {
      tileToTap = finder.votableLeftFromWhitespace();
    } else {
      tileToTap = null;
    }

    if (tileToTap != null) {
      tileTapped(tileToTap);
    }

    // * Add the new char, if invalid empty the list
    final konamiChar = key.toKonami;
    read(konamiCodeProvider.state).update((state) {
      final updated = [...state, konamiChar];
      return updated.isValid ? updated : [];
    });
  }
}
