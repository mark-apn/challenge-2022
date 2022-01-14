import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_challenge/models/models.dart';

enum PuzzleStatus { incomplete, complete }

enum TileMovementStatus { nothingTapped, cannotBeMoved, moved }

class PuzzleState extends Equatable {
  const PuzzleState({
    this.puzzle = const Puzzle(tiles: []),
    this.puzzleStatus = PuzzleStatus.incomplete,
    this.tileMovementStatus = TileMovementStatus.nothingTapped,
    this.numberOfCorrectTiles = 0,
    this.numberOfMoves = 0,
    this.lastTappedTile,
  });

  factory PuzzleState.initial([int size = 4]) {
    final puzzle = _generatePuzzle(size);
    return PuzzleState(
      puzzle: puzzle.sort(),
      numberOfCorrectTiles: puzzle.getNumberOfCorrectTiles(),
    );
  }

  /// [Puzzle] containing the current tile arrangement.
  final Puzzle puzzle;

  /// Status indicating the current state of the puzzle.
  final PuzzleStatus puzzleStatus;

  /// Status indicating if a [Tile] was moved or why a [Tile] was not moved.
  final TileMovementStatus tileMovementStatus;

  /// Represents the last tapped tile of the puzzle.
  ///
  /// The value is `null` if the user has not interacted with
  /// the puzzle yet.
  final Tile? lastTappedTile;

  /// Number of tiles currently in their correct position.
  final int numberOfCorrectTiles;

  /// Number of tiles currently not in their correct position.
  int get numberOfTilesLeft => puzzle.tiles.length - numberOfCorrectTiles - 1;

  /// Number representing how many moves have been made on the current puzzle.
  ///
  /// The number of moves is not always the same as the total number of tiles
  /// moved. If a row/column of 2+ tiles are moved from one tap, one move is
  /// added.
  final int numberOfMoves;

  PuzzleState copyWith({
    Puzzle? puzzle,
    PuzzleStatus? puzzleStatus,
    TileMovementStatus? tileMovementStatus,
    int? numberOfCorrectTiles,
    int? numberOfMoves,
    Tile? lastTappedTile,
  }) {
    return PuzzleState(
      puzzle: puzzle ?? this.puzzle,
      puzzleStatus: puzzleStatus ?? this.puzzleStatus,
      tileMovementStatus: tileMovementStatus ?? this.tileMovementStatus,
      numberOfCorrectTiles: numberOfCorrectTiles ?? this.numberOfCorrectTiles,
      numberOfMoves: numberOfMoves ?? this.numberOfMoves,
      lastTappedTile: lastTappedTile ?? this.lastTappedTile,
    );
  }

  @override
  List<Object?> get props => [
        puzzle,
        puzzleStatus,
        tileMovementStatus,
        numberOfCorrectTiles,
        numberOfMoves,
        lastTappedTile,
      ];
}

/// Build a randomized, solvable puzzle of the given size.
Puzzle _generatePuzzle(int size, {bool shuffle = true}) {
  final correctPositions = <Position>[];
  final currentPositions = <Position>[];
  final whitespacePosition = Position(x: size, y: size);

  // Create all possible board positions.
  for (var y = 1; y <= size; y++) {
    for (var x = 1; x <= size; x++) {
      if (x == size && y == size) {
        correctPositions.add(whitespacePosition);
        currentPositions.add(whitespacePosition);
      } else {
        final position = Position(x: x, y: y);
        correctPositions.add(position);
        currentPositions.add(position);
      }
    }
  }

  final random = Random();

  if (shuffle) {
    // Randomize only the current tile positions.
    currentPositions.shuffle(random);
  }

  var tiles = _getTileListFromPositions(
    size,
    correctPositions,
    currentPositions,
  );

  var puzzle = Puzzle(tiles: tiles);

  if (shuffle) {
    // Assign the tiles new current positions until the puzzle is solvable and
    // zero tiles are in their correct position.
    while (!puzzle.isSolvable() || puzzle.getNumberOfCorrectTiles() != 0) {
      currentPositions.shuffle(random);
      tiles = _getTileListFromPositions(
        size,
        correctPositions,
        currentPositions,
      );
      puzzle = Puzzle(tiles: tiles);
    }
  }

  return puzzle;
}

/// Build a list of tiles - giving each tile their correct position and a
/// current position.
List<Tile> _getTileListFromPositions(
  int size,
  List<Position> correctPositions,
  List<Position> currentPositions,
) {
  final whitespacePosition = Position(x: size, y: size);
  return [
    for (int i = 1; i <= size * size; i++)
      if (i == size * size)
        Tile(
          value: i,
          correctPosition: whitespacePosition,
          currentPosition: currentPositions[i - 1],
          isWhitespace: true,
        )
      else
        Tile(
          value: i,
          correctPosition: correctPositions[i - 1],
          currentPosition: currentPositions[i - 1],
        )
  ];
}
