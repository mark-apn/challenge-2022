import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/grpc/client.dart';
import 'package:shared/shared.dart';

class PuzzleVm {
  static final PuzzleVm instance = PuzzleVm._internal();

  PuzzleVm._internal();

  // * Send vote to server via client
  Future<void> tileTapped(Tile tappedTile) async {
    await GrpcClient.instance.voteOnTile(tappedTile.value);
  }

  Future<void> updatePointerPosition(Offset position) async {
    GrpcClient.instance.updatePointer(position.dx, position.dy);
  }
}
