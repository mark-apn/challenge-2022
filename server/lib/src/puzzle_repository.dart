import 'package:flutter_challenge_server/src/puzzle_dao.dart';
import 'package:flutter_challenge_server/src/puzzle_generator.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';
import 'package:shared/shared.dart';

class PuzzleRepository {
  final dao = PuzzleDao();

  Future<bool> voteForMoveOnLatestGame(int tileValue) async {
    final puzzle = await getLatestPuzzle();
    if (puzzle == null) return false;

    final updated = puzzle.copyWith(
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
    final puzzle = PuzzleGenerator(3).generate();

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
}
