import 'package:equatable/equatable.dart';

import 'models.dart';

/// {@template tile}
/// Model for a puzzle tile.
/// {@endtemplate}
class Tile extends Equatable {
  /// {@macro tile}
  const Tile({
    required this.value,
    required this.correctPosition,
    required this.currentPosition,
    this.numVotes = 0,
    this.isWhitespace = false,
  });

  /// Value representing the correct position of [Tile] in a list.
  final int value;

  /// Time a user has voted to move this tile
  final int numVotes;

  /// The correct 2D [Position] of the [Tile]. All tiles must be in their
  /// correct position to complete the puzzle.
  final Position correctPosition;

  /// The current 2D [Position] of the [Tile].
  final Position currentPosition;

  /// Denotes if the [Tile] is the whitespace tile or not.
  final bool isWhitespace;

  bool isTileMovable(Tile whitespaceTile) {
    if (this == whitespaceTile) {
      return false;
    }

    // A tile must be in the same row or column as the whitespace to move.
    if (whitespaceTile.currentPosition.x != currentPosition.x &&
        whitespaceTile.currentPosition.y != currentPosition.y) {
      return false;
    }
    return true;
  }

  /// Create a copy of this [Tile] with updated current position.
  Tile copyWith({
    int? value,
    Position? correctPosition,
    Position? currentPosition,
    int? numVotes,
    bool? isWhitespace,
  }) {
    return Tile(
      value: value ?? this.value,
      correctPosition: correctPosition ?? this.correctPosition,
      currentPosition: currentPosition ?? this.currentPosition,
      numVotes: numVotes ?? this.numVotes,
      isWhitespace: isWhitespace ?? this.isWhitespace,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'correctPosition': correctPosition.toMap(),
      'currentPosition': currentPosition.toMap(),
      'numVotes': numVotes,
      'isWhitespace': isWhitespace,
    };
  }

  factory Tile.fromMap(Map<String, dynamic> map) {
    return Tile(
      value: map['value']?.toInt() ?? 0,
      correctPosition: Position.fromMap(map['correctPosition']),
      currentPosition: Position.fromMap(map['currentPosition']),
      numVotes: map['numVotes']?.toInt() ?? 0,
      isWhitespace: map['isWhitespace'] ?? false,
    );
  }

  @override
  List<Object?> get props => [
        value,
        correctPosition,
        currentPosition,
        numVotes,
        isWhitespace,
      ];
}
