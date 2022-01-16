import 'package:flutter_challenge/generated/puzzle/v1/puzzle.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:shared/shared.dart';
import 'package:uuid/uuid.dart';

class GrpcClient {
  static final GrpcClient instance = GrpcClient._internal();

  GrpcClient._internal();

  final channel = ClientChannel(
    '127.0.0.1',
    port: 100,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );

  final userId = const Uuid().v4();

  PuzzleV1ServiceClient get client {
    return PuzzleV1ServiceClient(channel);
  }

  Stream<Puzzle> subscribeToPuzzle() {
    final call = client.subscribeToPuzzle(SubscribeToPuzzleRequest(userId: userId));
    return call.map((event) => toPuzzle(event.puzzle));
  }

  void sendKeepAliveSignal() {
    client.keepAlive(KeepAliveRequest(userId: userId));
  }

  Future<void> voteOnTile(int tileValue) {
    return client.voteForTile(VoteForTileRequest(userId: userId, tileValue: tileValue));
  }

  void close() {
    channel.shutdown();
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
