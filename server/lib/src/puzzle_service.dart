import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:flutter_challenge_server/generated/puzzle/v1/puzzle.pbgrpc.dart';
import 'package:flutter_challenge_server/src/puzzle_repository.dart';
import 'package:grpc/grpc.dart';
import 'package:shared/shared.dart';

class PuzzleV1Service extends PuzzleV1ServiceBase {
  // ignore: close_sinks
  final streamController = StreamController<Puzzle>.broadcast();
  final puzzleRepo = PuzzleRepository();

  @override
  Stream<SubscribeToPuzzleResponse> subscribeToPuzzle(ServiceCall call, SubscribeToPuzzleRequest request) {
    print('Recieved subscribe to puzzle request');
    puzzleRepo.subscribeToLatestPuzzle().then((feed) {
      if (feed == null) throw Exception('No active puzzle');

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

    return puzzleRepo.voteForMoveOnLatestGame(request.userId, request.tileValue).then((_) {
      return VoteForTileResponse();
    });
  }

  @override
  Future<UpdatePointerPositionResponse> updatePointerPosition(
    ServiceCall call,
    UpdatePointerPositionRequest request,
  ) async {
    puzzleRepo.updatePointerPosition(
      request.userId,
      request.position,
    );
    return UpdatePointerPositionResponse();
  }

  @override
  Future<UpdatePointerSettingsResponse> updatePointerSettings(
    ServiceCall call,
    UpdatePointerSettingsRequest request,
  ) async {
    // TODO: implement updatePointerSettings
    throw UnimplementedError();
  }
}

PuzzleMessage toPuzzleMessage(Puzzle puzzle) {
  return PuzzleMessage(
    id: puzzle.id,
    createdAt: Int64(puzzle.createdAt.millisecondsSinceEpoch),
    updatedAt: Int64(puzzle.updatedAt.millisecondsSinceEpoch),
    endsAt: puzzle.endsAt != null ? Int64(puzzle.endsAt!.millisecondsSinceEpoch) : Int64.ZERO,
    tiles: puzzle.tiles.map(_toTileMessage).toList(),
    participants: puzzle.participants.map(_toParticipantMessage).toList(),
    status: PuzzleMessage_PuzzleStatus.valueOf(puzzle.status),
    numMoves: puzzle.numMoves,
    totalVotes: puzzle.totalVotes,
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

ParticipantMessage _toParticipantMessage(Participant participant) {
  return ParticipantMessage(
    userId: participant.userId,
    lastActive: Int64(participant.lastActive.millisecondsSinceEpoch),
    pointer: participant.pointer != null ? _toPointerMessage(participant.pointer!) : null,
  );
}

PositionMessage _toPositionMessage(Position position) {
  return PositionMessage(
    x: position.x,
    y: position.y,
  );
}

PointerMessage _toPointerMessage(ParticipantPointer pointer) {
  return PointerMessage(
    position: pointer.position != null
        ? PointerPositionMessage(
            x: pointer.position!.x,
            y: pointer.position!.y,
          )
        : null,
    settings: PointerSettingsMessage(
      colorHex: pointer.settings.colorHex,
      shape: PointerSettingsMessage_PointerShape.valueOf(
          pointer.settings.shape.index + 1), // 0 is reserved for UNSPECIFIED
      size: pointer.settings.size,
    ),
  );
}
