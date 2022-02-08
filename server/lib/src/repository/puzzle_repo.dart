import 'package:flutter_challenge_server/di.dart';
import 'package:flutter_challenge_server/generated/puzzle/v1/puzzle.pb.dart';
import 'package:flutter_challenge_server/src/dao/puzzle_dao.dart';
import 'package:flutter_challenge_server/src/puzzle_generator.dart';
import 'package:flutter_challenge_server/src/repository/participant_repo.dart';
import 'package:flutter_challenge_server/src/repository/repository.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';
import 'package:shared/shared.dart';

class PuzzleRepo extends Repository<IPuzzleDao> {
  static PuzzleRepo get instance => DI.inject();

  Future<Puzzle?> getLatestPuzzle() async {
    final latest = await dao.latest();

    // * No active games
    if (latest == null) return null;

    return Puzzle.fromMap(latest);
  }

  Future<bool> voteForMoveOnLatestGame(String userId, int tileValue) async {
    final puzzle = await getLatestPuzzle();
    if (puzzle == null) return false;

    final tiles = puzzle.tiles.map((t) {
      if (t.value == tileValue) {
        return t.copyWith(numVotes: t.numVotes + 1);
      }
      return t;
    });

    print('Voting for move on puzzle with id ${puzzle.id}');
    await dao.merge(puzzle.id, {
      'tiles': tiles.map((e) => e.toMap()).toList(),
      'total_votes': puzzle.totalVotes + 1,
    });

    return true;
  }

  Future<AtomFeed?> subscribeToLatestPuzzle(String userId) async {
    final puzzle = await getLatestPuzzle();
    if (puzzle == null) return null;

    // * Check if we played before and have saved pointer settings in the participants table
    if (puzzle.getParticipantByUserId(userId).newUser) {
      final cachedParticipant = await ParticipantRepo.instance.getParticipant(userId);
      final updatedParticipants = puzzle.participants
          .addOrReplace(
            (participant) => participant.userId == userId,
            cachedParticipant,
          )
          .map((e) => e.toMap())
          .toList();
      await dao.merge(puzzle.id, {'participants': updatedParticipants});
    }

    return await dao.readFeed(puzzle.id);
  }

  Future<Puzzle> createNewPuzzle() async {
    final puzzle = const PuzzleGenerator(3).generate();

    await dao.insert(puzzle.toMap());

    return puzzle;
  }

  Future<Puzzle> moveTile(Puzzle puzzle, Tile tile) async {
    if (puzzle.isTileMovable(tile)) {
      // * Update tiles
      Puzzle updated = puzzle.moveTiles(tile, []);

      // * Set completed if needed
      if (updated.isComplete()) {
        updated = updated.copyWith(
          status: PUZZLE_STATUS_COMPLETE,
          endsAt: DateTime.now(),
        );
      }

      // * Reset all votes!
      final updatedMap = updated.copyWith(
        tiles: updated.tiles.map((t) => t.copyWith(numVotes: 0)).toList(),
      ).sorted().toMap();

      // * Save to DB
      await dao.merge(puzzle.id, {
        'num_moves': puzzle.numMoves + 1,
        'tiles': updatedMap['tiles'],
        'status': updatedMap['status'],
        'ends_at': updatedMap['ends_at'],
      });

      return updated;
    } else {
      return puzzle;
    }
  }

  Future<bool> updatePointerPosition(String userId, PointerPositionMessage message) async {
    final puzzle = await getLatestPuzzle();
    if (puzzle == null) return false;

    final position = PointerPosition(x: message.x, y: message.y);

    final participant = puzzle.getParticipantByUserId(userId);
    final participants = puzzle.participants.addOrReplace(
      (participant) => participant.userId == userId,
      participant.copyWith(
        pointer: participant.pointer.copyWith(position: position),
      ),
    );

    final result = await dao.merge(puzzle.id, {
      'participants': participants.map((p) => p.toMap()).toList(),
    });

    return result['replaced'] == 1;
  }

  Future<bool> updatePointerSettings(String userId, PointerSettingsMessage settings) async {
    final puzzle = await getLatestPuzzle();
    if (puzzle == null) return false;

    // Also update the participant table
    ParticipantRepo.instance.updatePointerSettings(userId, settings);

    final pointerSettings = PointerDisplaySettings(
      colorHex: settings.colorHex,
      size: settings.size,
      shape: PointerDisplayShape.values[settings.shape.value - 1],
    );

    final participant = puzzle.getParticipantByUserId(userId);
    final participants = [...puzzle.participants].addOrReplace(
      (participant) => participant.userId == userId,
      participant.copyWith(
        pointer: participant.pointer.copyWith(settings: pointerSettings),
      ),
    );

    final result = await dao.merge(puzzle.id, {
      'participants': participants.map((p) => p.toMap()).toList(),
    });

    return result['replaced'] == 1;
  }
}
