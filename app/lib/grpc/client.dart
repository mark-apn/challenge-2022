import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/generated/puzzle/v1/puzzle.pbgrpc.dart';
import 'package:flutter_challenge/grpc/channel.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:shared/shared.dart';

class GrpcClient {
  static final GrpcClient instance = GrpcClient._internal();

  GrpcClient._internal();

  late String userId;

  void init(String userId) {
    this.userId = userId;
  }

  final _puzzleStreamController = StreamController<Puzzle>();

  StreamSubscription<SubscribeToPuzzleResponse>? listener;
  DateTime? lastDataReceived;

  ClientChannelBase? _cachedChannel;
  ClientChannelBase get _newChannel => GrpcChannelBuilder().build;

  ClientChannelBase get _channel => _cachedChannel ??= _newChannel;

  PuzzleV1ServiceClient get client {
    return PuzzleV1ServiceClient(_channel);
  }

  Stream<Puzzle> subscribeToPuzzle() {
    _reconnectToPuzzle();
    return _puzzleStreamController.stream;
  }

  // Incremental backoff will start at 400ms and doubles every pass
  // TODO(mark): Add max retries
  Future<void> _reconnectToPuzzle([int incrementalBackoffDelay = 0]) async {
    debugPrint('Reconnecting to puzzle stream with clean channel');
    _cachedChannel = null;
    listener?.cancel();

    // TODO(mark): expose countdown and reconnect now button in the UI
    await Future.delayed(Duration(milliseconds: incrementalBackoffDelay));

    listener = client.subscribeToPuzzle(SubscribeToPuzzleRequest(userId: userId)).listen(
      (event) {
        lastDataReceived = DateTime.now();
        _puzzleStreamController.sink.add(toPuzzle(event.puzzle));
      },
    )
      ..onDone(_reconnectToPuzzle)
      ..onError((error, stackTrace) {
        debugPrint('Error: $error');
        // Delete previous channel, and reconnect if we can
        if (error is GrpcError && _shouldTryReconnecting(error)) {
          _reconnectToPuzzle(incrementalBackoffDelay == 0 ? 400 : incrementalBackoffDelay * 2);
        }
      });
  }

  Future<void> voteOnTile(int tileValue) async {
    // * Reconnect stream after idle time
    await _idleRefresh();

    // * Vote on the tile
    await client.voteForTile(
      VoteForTileRequest(userId: userId, tileValue: tileValue),
    );
  }

  Future<void> updateMousePointer(double x, double y) async {
    // * Reconnect stream after idle time
    await _idleRefresh();

    // * Update the mouse pointer
    await client.updateMousePosition(
      UpdateMousePositionRequest(userId: userId, position: MousePositionMessage(x: x, y: y)),
    );
  }

  Future<void> _idleRefresh() async {
    // * After a while in the background or idle, the server will send a
    // * disconnect and the app will not pick it up. The client will then
    // * try to reconnect to the server.
    if (lastDataReceived == null || DateTime.now().difference(lastDataReceived!).inMinutes > 2) {
      debugPrint('Pre-emptively reconnecting to puzzle stream');
      await _reconnectToPuzzle();
    }
  }

  bool _shouldTryReconnecting(GrpcError error) {
    // * When deploying the app the server will be down temporarily
    final serverUnavailable = error.code == StatusCode.unavailable;
    if (serverUnavailable) return true;

    // * After a while the stream can be terminated by the server.
    // * We check the error message string because the error code = 2 (UNKNOWN)
    final streamTerminated = (error.message?.contains('terminated') ?? false);
    if (streamTerminated) return true;

    return false;
  }
}

Puzzle toPuzzle(PuzzleMessage message) {
  return Puzzle(
    id: message.id,
    createdAt: DateTime.fromMillisecondsSinceEpoch(message.createdAt.toInt()),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(message.updatedAt.toInt()),
    endsAt: message.endsAt.isZero ? null : DateTime.fromMillisecondsSinceEpoch(message.endsAt.toInt()),
    tiles: message.tiles.map(_toTile).toList(),
    participants: message.participants.map(_toParticipant).toList(),
    numMoves: message.numMoves,
    status: message.status.value,
    totalVotes: message.totalVotes,
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

Participant _toParticipant(ParticipantMessage message) {
  return Participant(
    userId: message.userId,
    lastActive: DateTime.fromMillisecondsSinceEpoch(message.lastActive.toInt()),
    position: message.mousePosition.hasX() ? _toPointerPosition(message.mousePosition) : null,
  );
}

Position _toPosition(PositionMessage message) {
  return Position(
    x: message.x,
    y: message.y,
  );
}

PointerPosition _toPointerPosition(MousePositionMessage message) {
  return PointerPosition(
    x: message.x,
    y: message.y,
  );
}