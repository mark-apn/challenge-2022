import 'package:flutter_challenge_server/generated/puzzle/v1/puzzle.pb.dart';
import 'package:flutter_challenge_server/src/puzzle_dao.dart';
import 'package:flutter_challenge_server/src/puzzle_generator.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';
import 'package:shared/shared.dart';

class PuzzleRepository {
  final dao = PuzzleDao();

  Future<bool> voteForMoveOnLatestGame(String userId, int tileValue) async {
    final puzzle = await getLatestPuzzle();
    if (puzzle == null) return false;

    // * Add userId if not yet present in participants list
    List<Participant> participants = [...puzzle.participants];
    int index = participants.indexWhere((p) => p.userId == userId);
    if (index == -1) {
      participants.add(Participant(userId: userId, lastActive: DateTime.now()));
    } else {
      participants[index] = participants[index].copyWith(lastActive: DateTime.now());
    }

    final updated = puzzle.copyWith(
        participants: participants,
        totalVotes: puzzle.totalVotes + 1,
        tiles: puzzle.tiles.map((t) {
          if (t.value == tileValue) {
            return t.copyWith(numVotes: t.numVotes + 1);
          }
          return t;
        }).toList());

    print('Voting for move on puzzle with id ${puzzle.id}');
    await dao.update(puzzle.id, updated.toMap());

    return true;
  }

  Future<Puzzle?> getLatestPuzzle() async {
    final latest = await dao.latest();

    // * No active games
    if (latest == null) return null;

    return Puzzle.fromMap(latest);
  }

  Future<AtomFeed?> subscribeToLatestPuzzle() async {
    final puzzle = await getLatestPuzzle();

    if (puzzle == null) return null;

    return await dao.readFeed(puzzle.id);
  }

  Future<Puzzle> createNewPuzzle() async {
    final puzzle = const PuzzleGenerator(3).generate();

    await dao.insert(puzzle.toMap());

    return puzzle;
  }

  Future<bool> moveTile(Puzzle puzzle, Tile tile) async {
    if (puzzle.isTileMovable(tile)) {
      // * Update tiles
      Puzzle updated = puzzle.moveTiles(tile, []);

      // * Set completed if needed
      if (updated.isComplete()) {
        updated = updated.copyWith(status: PUZZLE_STATUS_COMPLETE);
      }

      // * Reset all votes!
      updated = updated.copyWith(
        tiles: updated.tiles.map((t) => t.copyWith(numVotes: 0)).toList(),
      );

      // * Save to DB
      final result = await dao.update(puzzle.id, updated.sorted().toMap());

      return result['replaced'] == 1;
    } else {
      return false;
    }
  }

  Future<bool> updatePointerPosition(String userId, PointerPositionMessage message) async {
    final puzzle = await getLatestPuzzle();
    if (puzzle == null) return false;

    final position = PointerPosition(x: message.x, y: message.y);

    // * Add userId if not yet present in participants list
    List<Participant> participants = [...puzzle.participants];
    int index = participants.indexWhere((p) => p.userId == userId);
    if (index == -1) {
      participants.add(Participant(userId: userId, lastActive: DateTime.now(), position: position));
    } else {
      participants[index] = participants[index].copyWith(lastActive: DateTime.now(), position: position);
    }

    final updated = puzzle.copyWith(participants: participants);
    final result = await dao.update(puzzle.id, updated.toMap());

    return result['replaced'] == 1;
  }
}
