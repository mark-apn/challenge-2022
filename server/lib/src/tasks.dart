import 'dart:async';

import 'package:flutter_challenge_server/src/puzzle_repository.dart';
import 'package:intl/intl.dart';
import 'package:shared/shared.dart';

class UpdatePuzzle extends Task {
  @override
  Future<void> handle() async {
    final puzzleRepo = PuzzleRepository();

    final puzzle = await puzzleRepo.getLatestPuzzle();

    if (puzzle == null) {
      log('Create new puzzle');

      // * Create a new puzzle if there is no puzzle
      puzzleRepo.createNewPuzzle();
    } else if (puzzle.status == PUZZLE_STATUS_INCOMPLETE) {
      log('Checking for votes');

      // * Get tiles with most votes and is movable (sort and get first)
      puzzle.tiles.sort((a, b) => b.numVotes.compareTo(a.numVotes));
      final tilesWithVotes = puzzle.tiles.where((tile) => tile.numVotes > 0 && puzzle.isTileMovable(tile));

      if (tilesWithVotes.isEmpty) {
        log('No tiles with votes');
      } else {
        final tile = tilesWithVotes.first;
        log('Tile with most votes: ${tile.value} (${tile.numVotes} votes)');

        // * If vote count is greater than 0, move the tile

        log('Moving tile');
        final result = await puzzleRepo.moveTile(puzzle, tile);
        log('Move tile result: ${result ? 'success' : 'failure'}');
      }
    } else if (puzzle.status == PUZZLE_STATUS_COMPLETE) {
      log('Puzzle is complete! Checking if it is time to create a new puzzle');

      // * Check last updated time (keep last completed puzzle active for a while)
      /// TODO(mark): add solvedAt field to puzzle and add delay after puzzle is solved

      // * If last updated time is greater than a certain time, create a new puzzle
      await puzzleRepo.createNewPuzzle();

      // * save to DB
    }
  }
}

abstract class Task {
  String get name => runtimeType.toString();

  void execute() {
    log('Executing');
    handle().then((_) => log('Done'));
  }

  Future<void> handle();

  void log(String message) {
    final date = DateFormat.yMd().add_Hms().format(DateTime.now());
    print('[$date] $name: $message');
  }
}

class ScheduledTask {
  final Timer timer;
  final Task task;

  String get name => task.name;

  ScheduledTask(this.timer, this.task);
}
