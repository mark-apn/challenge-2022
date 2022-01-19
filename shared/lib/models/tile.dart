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
    this.previousPosition,
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

  /// The previous 2D [Position] of the [Tile].
  final Position? previousPosition;

  /// Denotes if the [Tile] is the whitespace tile or not.
  final bool isWhitespace;

  /// Create a copy of this [Tile] with updated current position.
  Tile copyWith({
    int? value,
    Position? correctPosition,
    Position? currentPosition,
    Position? previousPosition,
    int? numVotes,
    bool? isWhitespace,
  }) {
    return Tile(
      value: value ?? this.value,
      correctPosition: correctPosition ?? this.correctPosition,
      currentPosition: currentPosition ?? this.currentPosition,
      previousPosition: previousPosition ?? this.currentPosition,
      numVotes: numVotes ?? this.numVotes,
      isWhitespace: isWhitespace ?? this.isWhitespace,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'correctPosition': correctPosition.toMap(),
      'currentPosition': currentPosition.toMap(),
      'previousPosition': previousPosition?.toMap(),
      'numVotes': numVotes,
      'isWhitespace': isWhitespace,
    };
  }

  factory Tile.fromMap(Map<String, dynamic> map) {
    return Tile(
      value: map['value']?.toInt() ?? 0,
      correctPosition: Position.fromMap(map['correctPosition']),
      currentPosition: Position.fromMap(map['currentPosition']),
      previousPosition: map['previousPosition'] != null ? Position.fromMap(map['previousPosition']) : null,
      numVotes: map['numVotes']?.toInt() ?? 0,
      isWhitespace: map['isWhitespace'] ?? false,
    );
  }

  @override
  List<Object?> get props => [
        value,
        correctPosition,
        currentPosition,
        previousPosition,
        numVotes,
        isWhitespace,
      ];
}
