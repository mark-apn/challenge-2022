import 'dart:async';

import 'package:flutter_challenge/extensions.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createdAtLabelProvider = StateProvider.autoDispose((ref) => "...");

final createdAtTimerProvider = Provider.autoDispose<void>((ref) {
  final createdAt = ref.watch(puzzleProvider.select((value) => value.puzzle.createdAt));

  Timer? timer;
  timer = Timer.periodic(const Duration(seconds: 1), (_) {
    final isFinished = ref.watch(puzzleProvider.select((value) => value.puzzle.isFinished));
    final label = DateTime.now().difference(createdAt).toTimeString();
    ref.update(createdAtLabelProvider, label);

    if (isFinished) {
      timer?.cancel();
    }
  });

  // * Cleanup when we dont need it anymore
  ref.onDispose(() {
    timer?.cancel();
  });
});
