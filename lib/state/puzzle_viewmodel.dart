import 'package:flutter_challenge/models/models.dart';
import 'package:flutter_challenge/models/tile.dart';
import 'package:flutter_challenge/state/providers.dart';
import 'package:flutter_challenge/state/puzzle_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PuzzleViewModel {
  final Reader read;

  PuzzleViewModel(this.read);

  void tileTapped(Tile tappedTile) {
    final state = read(puzzleProvider);

    if (state.puzzle.isTileMovable(tappedTile)) {
      final mutablePuzzle = Puzzle(tiles: [...state.puzzle.tiles]);
      final puzzle = mutablePuzzle.moveTiles(tappedTile, []);
      if (puzzle.isComplete()) {
        emit(
          state.copyWith(
            puzzle: puzzle.sort(),
            puzzleStatus: PuzzleStatus.complete,
            tileMovementStatus: TileMovementStatus.moved,
            numberOfCorrectTiles: puzzle.getNumberOfCorrectTiles(),
            numberOfMoves: state.numberOfMoves + 1,
            lastTappedTile: tappedTile,
          ),
        );
      } else {
        emit(
          state.copyWith(
            puzzle: puzzle.sort(),
            tileMovementStatus: TileMovementStatus.moved,
            numberOfCorrectTiles: puzzle.getNumberOfCorrectTiles(),
            numberOfMoves: state.numberOfMoves + 1,
            lastTappedTile: tappedTile,
          ),
        );
      }
    } else {
      emit(
        state.copyWith(tileMovementStatus: TileMovementStatus.cannotBeMoved),
      );
    }
  }

  void emit(PuzzleState updatedState) {
    read(puzzleProvider.state).update((state) => updatedState);
  }
}
