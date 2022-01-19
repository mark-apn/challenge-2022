import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:flutter_challenge_server/generated/puzzle/v1/puzzle.pbgrpc.dart';
import 'package:flutter_challenge_server/src/puzzle_repository.dart';
import 'package:grpc/grpc.dart';
import 'package:shared/shared.dart';

class PuzzleV1Service extends PuzzleV1ServiceBase {
  final streamController = StreamController<Puzzle>.broadcast();

  final usersAlive = <String, DateTime>{};
  final puzzleRepo = PuzzleRepository();

  @override
  Stream<SubscribeToPuzzleResponse> subscribeToPuzzle(ServiceCall call, SubscribeToPuzzleRequest request) {
    print('Recieved subscribe to puzzle request');
    puzzleRepo.subscribeToLatestPuzzle().then((feed) {
      if (feed == null) throw new Exception('No active puzzle');

      puzzleRepo.getLatestPuzzle().then((value) {
        if (value != null) {
          streamController.sink.add(value);
        }
      });

      StreamSubscription? streamSubscription;
      streamSubscription = feed.listen((updated) {
        if (call.isCanceled) {
          streamSubscription?.cancel();
        } else {
          final data = (updated as Map)['new_val'] as Map<String, dynamic>;
          final newPuzzle = Puzzle.fromMap(data);
          streamController.sink.add(newPuzzle);
        }
      });
    });

    return streamController.stream.map(
      (puzzle) => SubscribeToPuzzleResponse()..puzzle = toPuzzleMessage(puzzle),
    );
  }

  @override
  Future<VoteForTileResponse> voteForTile(ServiceCall call, VoteForTileRequest request) {
    print('Recieved vote for tile request');
    // * Keeps user stream alive
    usersAlive[request.userId] = DateTime.now();

    return puzzleRepo.voteForMoveOnLatestGame(request.tileValue).then((_) {
      return VoteForTileResponse();
    });
  }

  @override
  Future<KeepAliveResponse> keepAlive(ServiceCall call, KeepAliveRequest request) async {
    // * Keeps user stream alive
    usersAlive[request.userId] = DateTime.now();

    return KeepAliveResponse();
  }
}

PuzzleMessage toPuzzleMessage(Puzzle puzzle) {
  return PuzzleMessage(
    id: puzzle.id,
    createdAt: Int64(puzzle.createdAt.millisecondsSinceEpoch),
    updatedAt: Int64(puzzle.updatedAt.millisecondsSinceEpoch),
    tiles: puzzle.tiles.map(_toTileMessage).toList(),
    status: PuzzleMessage_PuzzleStatus.valueOf(puzzle.status),
    numMoves: puzzle.num_moves,
  );
}

TileMessage _toTileMessage(Tile tile) {
  return TileMessage(
    value: tile.value,
    currentPosition: _toPositionMessage(tile.currentPosition),
    correctPosition: _toPositionMessage(tile.correctPosition),
    numVotes: tile.numVotes,
    isWhitespace: tile.isWhitespace,
  );
}

TilePosition _toPositionMessage(Position position) {
  return TilePosition(
    x: position.x,
    y: position.y,
  );
}
