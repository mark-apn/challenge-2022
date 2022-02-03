import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/grpc/client.dart';
import 'package:flutter_challenge/utils/tracker.dart';
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
}
