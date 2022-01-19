
import 'dart:ui';
import 'package:equatable/equatable.dart';

/// {@template position}
/// 2-dimensional position model.
///
/// (1, 1) is the top left corner of the board.
/// {@endtemplate}
class Position extends Equatable implements Comparable<Position> {
  /// {@macro position}
  const Position({required this.x, required this.y});

  /// The x position.
  final int x;

  /// The y position.
  final int y;

  @override
  List<Object> get props => [x, y];

  @override
  int compareTo(Position other) {
    if (y < other.y) {
      return -1;
    } else if (y > other.y) {
      return 1;
    } else {
      if (x < other.x) {
        return -1;
      } else if (x > other.x) {
        return 1;
      } else {
        return 0;
      }
    }
  }

  Map<String, dynamic> toMap() => {
        'x': x,
        'y': y,
      };

  factory Position.fromMap(Map<String, dynamic> map) => Position(
        x: map['x']?.toInt() ?? 0,
        y: map['y']?.toInt() ?? 0,
      );

  Position copyWith({
    int? x,
    int? y,
  }) {
    return Position(
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  Rect getRect({required double tileSize}) => Rect.fromLTWH(
        (x - 1) * tileSize,
        (y - 1) * tileSize,
        tileSize,
        tileSize,
      );
}
