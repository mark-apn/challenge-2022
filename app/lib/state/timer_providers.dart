import 'dart:async';

import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createdAtTime = StateProvider.autoDispose((ref) => "...");

final createdAtTimerProvider = Provider.autoDispose<void>((ref) {
  final createdAt = ref.watch(puzzleProvider.select((value) => value.puzzle.createdAt));

  String toTimeString(int time1, int time2, [int? time3]) {
    if (time3 == null) {
      return "${time1.toString().padLeft(2, '0')}:${time2.toString().padLeft(2, '0')}";
    }
    return "${time1.toString().padLeft(2, '0')}:${time2.toString().padLeft(2, '0')}:${time3.toString().padLeft(2, '0')}";
  }

  final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    final now = DateTime.now();
    final diff = now.difference(createdAt);

    final String displayTime;
    if (diff.inMinutes < 60) {
      displayTime = toTimeString(diff.inMinutes, diff.inSeconds % 60);
    } else if (diff.inHours < 24) {
      displayTime = toTimeString(diff.inHours, diff.inMinutes % 60, diff.inSeconds % 60);
    } else if (diff.inDays == 1) {
      displayTime = "1 day";
    } else {
      displayTime = "${diff.inDays} days";
    }

    ref.read(createdAtTime.state).state = displayTime;
  });

  // * Cleanup when we dont need it anymore
  ref.onDispose(() {
    timer.cancel();
  });
});