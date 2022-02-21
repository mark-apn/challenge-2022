import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'models.dart';

const PUZZLE_STATUS_INCOMPLETE = 1;
const PUZZLE_STATUS_COMPLETE = 2;
const PUZZLE_STATUS_CLOSED = 3;

// A 3x3 puzzle board visualization:
//
//   ┌─────1───────2───────3────► x
//   │  ┌─────┐ ┌─────┐ ┌─────┐
//   1  │  1  │ │  2  │ │  3  │
//   │  └─────┘ └─────┘ └─────┘
//   │  ┌─────┐ ┌─────┐ ┌─────┐
//   2  │  4  │ │  5  │ │  6  │
//   │  └─────┘ └─────┘ └─────┘
//   │  ┌─────┐ ┌─────┐
//   3  │  7  │ │  8  │
//   │  └─────┘ └─────┘
//   ▼
//   y
//
// This puzzle is in its completed state (i.e. the tiles are arranged in
// ascending order by value from top to bottom, left to right).
//
// Each tile has a value (1-8 on example above), and a correct and current
// position.
//
// The correct position is where the tile should be in the completed
// puzzle. As seen from example above, tile 2's correct position is (2, 1).
// The current position is where the tile is currently located on the board.

/// {@template puzzle}
/// Model for a puzzle.
/// {@endtemplate}
class Puzzle extends Equatable {
  /// {@macro puzzle}
  const Puzzle({
    required this.id,
    required this.tiles,
    required this.createdAt,
    required this.updatedAt,
    this.endsAt,
    this.participants = const [],
    this.status = PUZZLE_STATUS_INCOMPLETE,
    this.numMoves = 0,
    this.totalVotes = 0,
  });

  factory Puzzle.fromTiles(List<Tile> tiles) => Puzzle(
        id: Uuid().v4(),
        tiles: tiles,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  factory Puzzle.empty() => Puzzle(
        id: Uuid().v4(),
        tiles: [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  /// The UUID of the puzzle.
  final String id;

  /// List of [Tile]s representing the puzzle's current arrangement.
  final List<Tile> tiles;

  /// The date this puzzle was created.
  final DateTime createdAt;

  /// The date this puzzle was last updated.
  final DateTime updatedAt;

  /// The date this puzzle wil end. If null this puzzle will never (automatically) end.
  final DateTime? endsAt;

  /// List of user ids that have participated in this puzzle.
  final List<Participant> participants;

  /// The current status of the puzzle.
  final int status;

  /// The number of moves made to solve the puzzle.
  final int numMoves;

  /// The total amount of votes cast on this puzzle
  final int totalVotes;

  bool get isFinished => status != PUZZLE_STATUS_INCOMPLETE;

  Participant getParticipantByUserId(String userId) => participants.firstWhere(
        (p) => p.userId == userId,
        orElse: () => Participant(userId: userId),
      );



  /// Get the dimension of a puzzle given its tile arrangement.
  ///
  /// Ex: A 4x4 puzzle has a dimension of 4.
  int getDimension() {
    return sqrt(tiles.length).toInt();
  }

  /// Get the single whitespace tile object in the puzzle.
  Tile? getWhitespaceTile() {
    final matches = tiles.where((tile) => tile.isWhitespace);
    if(matches.isEmpty) return null;
    return matches.first;
  }

  /// Gets the number of tiles that are currently in their correct position.
  int getNumberOfCorrectTiles() {
    final whitespaceTile = getWhitespaceTile();
    var numberOfCorrectTiles = 0;
    for (final tile in tiles) {
      if (tile != whitespaceTile) {
        if (tile.currentPosition == tile.correctPosition) {
          numberOfCorrectTiles++;
        }
      }
    }
    return numberOfCorrectTiles;
  }

  /// Determines if the puzzle is completed.
  bool isComplete() {
    return (tiles.length - 1) - getNumberOfCorrectTiles() == 0;
  }

  /// Determines if the tapped tile can move in the direction of the whitespace
  /// tile.
  bool isTileMovable(Tile tile) {
    final whitespaceTile = getWhitespaceTile();
    if(whitespaceTile == null) return false;

    return tile.isTileMovable(whitespaceTile);
  }

  /// Shifts one or many tiles in a row/column with the whitespace and returns
  /// the modified puzzle.
  ///
  // Recursively stores a list of all tiles that need to be moved and passes the
  // list to _swapTiles to individually swap them.
  Puzzle moveTiles(Tile currentTile, List<Tile> tilesToSwap) {
    final tile = currentTile.copyWith();
    final whitespaceTile = getWhitespaceTile()!;
    final deltaX = whitespaceTile.currentPosition.x - tile.currentPosition.x;
    final deltaY = whitespaceTile.currentPosition.y - tile.currentPosition.y;

    if ((deltaX.abs() + deltaY.abs()) > 1) {
      final shiftPointX = tile.currentPosition.x + deltaX.sign;
      final shiftPointY = tile.currentPosition.y + deltaY.sign;
      final tileToSwapWith = tiles.singleWhere(
        (tile) => tile.currentPosition.x == shiftPointX && tile.currentPosition.y == shiftPointY,
      );
      tilesToSwap.add(tile);
      return moveTiles(tileToSwapWith, tilesToSwap);
    } else {
      tilesToSwap.add(tile);
      return _swapTiles(tilesToSwap);
    }
  }

  /// Returns puzzle with new tile arrangement after individually swapping each
  /// tile in tilesToSwap with the whitespace.
  Puzzle _swapTiles(List<Tile> tilesToSwap) {
    for (final tileToSwap in tilesToSwap.reversed) {
      final tileIndex = tiles.indexWhere((tile) => tile.value == tileToSwap.value);
      final tile = tiles[tileIndex];
      final whitespaceTile = getWhitespaceTile()!;
      final whitespaceTileIndex = tiles.indexOf(whitespaceTile);

      // Swap current board positions of the moving tile and the whitespace.
      tiles[tileIndex] = tile.copyWith(currentPosition: whitespaceTile.currentPosition);
      tiles[whitespaceTileIndex] = whitespaceTile.copyWith(currentPosition: tile.currentPosition);
    }

    return copyWith(
      tiles: tiles,
      numMoves: numMoves + 1,
    );
  }

  /// Determines if the puzzle is solvable.
  bool isSolvable() {
    final size = getDimension();
    final height = tiles.length ~/ size;
    assert(
      size * height == tiles.length,
      'tiles must be equal to size * height',
    );
    final inversions = countInversions();

    if (size.isOdd) {
      return inversions.isEven;
    }

    final whitespace = tiles.singleWhere((tile) => tile.isWhitespace);
    final whitespaceRow = whitespace.currentPosition.y;

    if (((height - whitespaceRow) + 1).isOdd) {
      return inversions.isEven;
    } else {
      return inversions.isOdd;
    }
  }

  /// Gives the number of inversions in a puzzle given its tile arrangement.
  ///
  /// An inversion is when a tile of a lower value is in a greater position than
  /// a tile of a higher value.
  int countInversions() {
    var count = 0;
    for (var a = 0; a < tiles.length; a++) {
      final tileA = tiles[a];
      if (tileA.isWhitespace) {
        continue;
      }

      for (var b = a + 1; b < tiles.length; b++) {
        final tileB = tiles[b];
        if (_isInversion(tileA, tileB)) {
          count++;
        }
      }
    }
    return count;
  }

  /// Determines if the two tiles are inverted.
  bool _isInversion(Tile a, Tile b) {
    if (!b.isWhitespace && a.value != b.value) {
      if (b.value < a.value) {
        return b.currentPosition.compareTo(a.currentPosition) > 0;
      } else {
        return a.currentPosition.compareTo(b.currentPosition) > 0;
      }
    }
    return false;
  }

  /// Sorts puzzle tiles so they are in order of their current position.
  Puzzle sorted() {
    final sortedTiles = tiles.toList()
      ..sort((tileA, tileB) {
        return tileA.currentPosition.compareTo(tileB.currentPosition);
      });
    return copyWith(tiles: sortedTiles);
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        endsAt,
        participants,
        tiles,
        status,
        numMoves,
        totalVotes,
      ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
      'ends_at': endsAt?.millisecondsSinceEpoch,
      'participants': participants.map((x) => x.toMap()).toList(),
      'tiles': tiles.map((x) => x.toMap()).toList(),
      'status': status,
      'num_moves': numMoves,
      'total_votes': totalVotes,
    };
  }

  factory Puzzle.fromMap(Map<String, dynamic> map) {
    return Puzzle(
      id: map['id']!,
      createdAt: map['created_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['created_at']) : DateTime.now(),
      updatedAt: map['updated_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updated_at']) : DateTime.now(),
      endsAt: map['ends_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['ends_at']) : null,
      participants: List<Participant>.from(map['participants']?.map((e) => Participant.fromMap(e)).toList()),
      tiles: List<Tile>.from(map['tiles']?.map((x) => Tile.fromMap(x))),
      status: map['status']?.toInt() ?? 0,
      numMoves: map['num_moves']?.toInt() ?? 0,
      totalVotes: map['total_votes']?.toInt() ?? 0,
    );
  }

  Puzzle copyWith({
    List<Tile>? tiles,
    DateTime? createdAt,
    DateTime? endsAt,
    List<Participant>? participants,
    int? status,
    int? numMoves,
    int? totalVotes,
  }) {
    return Puzzle(
      id: this.id,
      tiles: tiles ?? this.tiles,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: DateTime.now(),
      endsAt: endsAt ?? this.endsAt,
      participants: participants ?? this.participants,
      status: status ?? this.status,
      numMoves: numMoves ?? this.numMoves,
      totalVotes: totalVotes ?? this.totalVotes,
    );
  }
}
