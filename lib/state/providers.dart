import 'package:flutter_challenge/state/puzzle_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'puzzle_state.dart';

// Inital puzzle state
final puzzleProvider = StateProvider((_) => PuzzleState.initial(6));

// Provides the viewmodel that is in charge of changing the puzzle state
final puzzleViewModel = Provider((ref) => PuzzleViewModel(ref.read));
