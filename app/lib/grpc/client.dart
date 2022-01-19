import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/generated/puzzle/v1/puzzle.pbgrpc.dart';
import 'package:flutter_challenge/grpc/channel.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:shared/shared.dart';
import 'package:uuid/uuid.dart';

class GrpcClient {
  static final GrpcClient instance = GrpcClient._internal();

  GrpcClient._internal();

  final _puzzleStreamController = StreamController<Puzzle>();

  ClientChannelBase? _cachedChannel;
  ClientChannelBase get _newChannel => GrpcChannelBuilder().build;

  ClientChannelBase get _channel => _cachedChannel ??= _newChannel;
  CallOptions get _defaultOptions {
    return CallOptions();
  }

  final userId = const Uuid().v4();

  PuzzleV1ServiceClient get client {
    return PuzzleV1ServiceClient(_channel);
  }

  Stream<Puzzle> subscribeToPuzzle() {
    _reconnectToPuzzle();
    return _puzzleStreamController.stream;
  }

  void _reconnectToPuzzle() {
    client
        .subscribeToPuzzle(
      SubscribeToPuzzleRequest(userId: userId),
      options: _defaultOptions,
    )
        .listen(
      (event) {
        _puzzleStreamController.sink.add(toPuzzle(event.puzzle));
      },
    ).onError((error, stackTrace) {
      if (error is GrpcError) {
        // Delete previous channel, and reconnect when stream was terminated
        // We check the error message because the error code = 2 (UNKNOWN)
        if (error.code == StatusCode.unavailable || (error.message?.contains('Stream was terminated') ?? false)) {
          debugPrint('Reconnecting to puzzle stream');
          _cachedChannel = null;
          _reconnectToPuzzle();
        } else {
          debugPrint('Error: $error');
        }
      } else {
        debugPrint('Error: $error');
      }
    });
  }

  void sendKeepAliveSignal() {
    client.keepAlive(KeepAliveRequest(userId: userId));
  }

  Future<void> voteOnTile(int tileValue) {
    return client.voteForTile(
      VoteForTileRequest(userId: userId, tileValue: tileValue),
      options: _defaultOptions,
    );
  }
}

Puzzle toPuzzle(PuzzleMessage message) {
  return Puzzle(
    id: message.id,
    createdAt: DateTime.fromMillisecondsSinceEpoch(message.createdAt.toInt()),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(message.updatedAt.toInt()),
    tiles: message.tiles.map(_toTile).toList(),
    num_moves: message.numMoves,
    status: message.status.value,
  );
}

Tile _toTile(TileMessage message) {
  return Tile(
    value: message.value,
    correctPosition: _toPosition(message.correctPosition),
    currentPosition: _toPosition(message.currentPosition),
    isWhitespace: message.isWhitespace,
    numVotes: message.numVotes,
  );
}

Position _toPosition(TilePosition message) {
  return Position(
    x: message.x,
    y: message.y,
  );
}
