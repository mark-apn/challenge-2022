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

  ClientChannelBase? _cachedChannel;
  ClientChannelBase get _newChannel => GrpcChannelBuilder().build;

  ClientChannelBase get _channel => _cachedChannel ??= _newChannel;
  CallOptions get _defaultOptions {
    return CallOptions();
  }

  PuzzleV1ServiceClient get client {
    return PuzzleV1ServiceClient(_channel);
  }

  Stream<Puzzle> subscribeToPuzzle() {
    _reconnectToPuzzle();
    return _puzzleStreamController.stream;
  }

  // Incremental backoff will start ad 400ms and doubles every pass
  // TODO(mark): Add max retries
  Future<void> _reconnectToPuzzle([int incrementalBackoffDelay = 0]) async {
    debugPrint('Reconnecting to puzzle stream');
    listener?.cancel();
    // TODO(mark): expose countdown and reconnect now button in the UI
    await Future.delayed(Duration(milliseconds: incrementalBackoffDelay));

    listener = client
        .subscribeToPuzzle(
      SubscribeToPuzzleRequest(userId: userId),
      options: _defaultOptions,
    )
        .listen(
      (event) {
        _puzzleStreamController.sink.add(toPuzzle(event.puzzle));
      },
    )
      ..onDone(_reconnectToPuzzle)
      ..onError((error, stackTrace) {
        debugPrint('Error: $error');
        // Delete previous channel, and reconnect if we can
        if (error is GrpcError && _shouldTryReconnecting(error)) {
          _cachedChannel = null;
          _reconnectToPuzzle(incrementalBackoffDelay == 0 ? 400 : incrementalBackoffDelay * 2);
        }
      });
  }

  Future<void> voteOnTile(int tileValue) async {
    await client.voteForTile(
      VoteForTileRequest(userId: userId, tileValue: tileValue),
      options: _defaultOptions,
    );
  }

  bool _shouldTryReconnecting(GrpcError error) {
    // * On server updates the server will be down temporarily
    final serverUnavailable = error.code == StatusCode.unavailable;
    if (serverUnavailable) return true;

    // * The stream can be aborted by the server (Envoy proxy timeouts)
    final connectionTerminated = error.code == StatusCode.aborted;
    if (connectionTerminated) return true;

    // * After a while the stream can be terminated by the server.
    // * We check the error message string because the error code = 2 (UNKNOWN)
    final streamTerminated = (error.message?.contains('Stream was terminated') ?? false);
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
    // We don't care about the participant ids to create an empty list of strings
    participants: List.generate(message.participantCount, (index) => ""),
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

Position _toPosition(TilePosition message) {
  return Position(
    x: message.x,
    y: message.y,
  );
}
