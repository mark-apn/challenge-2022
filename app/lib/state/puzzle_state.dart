import 'package:equatable/equatable.dart';
import 'package:shared/shared.dart';

enum PuzzleStatus { incomplete, complete }

enum TileMovementStatus { nothingTapped, cannotBeMoved, moved }

class PuzzleState extends Equatable {
  const PuzzleState({
    required this.puzzle,
    this.isLoading = false,
    this.error,
  });

  /// [Puzzle] containing the current tile arrangement.
  final Puzzle puzzle;

  /// Indicates whether the puzzle is currently being loaded.
  final bool isLoading;

  /// Error that occurred while loading the puzzle.
  final dynamic error;

  /// Number of tiles currently in their correct position.
  int get numberOfCorrectTiles => puzzle.getNumberOfCorrectTiles();

  /// Number of tiles currently not in their correct position.
  int get numberOfTilesLeft => puzzle.tiles.length - numberOfCorrectTiles - 1;

  /// Indicates whether the state is in a valid state.
  bool get isError => error != null;

  PuzzleState copyWith({
    Puzzle? puzzle,
    bool? isLoading,
  }) {
    return PuzzleState(
      puzzle: puzzle ?? this.puzzle,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        puzzle,
        isLoading,
        error,
      ];
}
