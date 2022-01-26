import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/prefs.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_challenge/state/puzzle_viewmodel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';

class Pointers extends HookConsumerWidget {
  const Pointers({
    Key? key,
    required this.boardSize,
  }) : super(key: key);

  final double boardSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mousePosition = useState<Offset?>(null);
    final isUpdated = useState(false);

    // * Only send max 10 position updates per second
    Timer? throttleTimer;
    useEffect(() {
      throttleTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        if (mousePosition.value != null && isUpdated.value == true) {
          PuzzleVm.instance.updateMousePosition(mousePosition.value!);
          isUpdated.value = false;
        }
      });

      return () => throttleTimer?.cancel();
    }, const []);

    final userId = Prefs.instance.getString(kUserId);
    final otherPointers = ref.watch(
      puzzleProvider.select(
        (state) => state.puzzle.participants
            .whereNot((p) => p.userId == userId)
            .where((p) => p.position != null)
            .map((p) => p.position!)
            .toList(),
      ),
    );

    final PointerPosition? myPointer;
    if (mousePosition.value != null) {
      myPointer = PointerPosition(
        x: mousePosition.value!.dx,
        y: mousePosition.value!.dy,
      );
    } else {
      myPointer = null;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.none,
      opaque: false,
      onHover: (event) {
        // Convert localPosition to 0 -> 1 coords relative to the board
        // so we can plot them on all participants boards
        final localPosition = event.localPosition;
        isUpdated.value = true;
        mousePosition.value = Offset(
          localPosition.dx / boardSize,
          localPosition.dy / boardSize,
        );
      },
      child: Stack(
        children: [
          ...otherPointers.map((p) => Pointer(position: p)).toList(),
          if (myPointer != null)
            Pointer(
              position: myPointer,
              duration: Duration.zero,
            ),
        ],
      ),
    );
  }
}

class Pointer extends HookWidget {
  const Pointer({
    Key? key,
    required this.position,
    this.duration = const Duration(milliseconds: 100),
  }) : super(key: key);

  final PointerPosition position;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final color = useState(Color.fromARGB(
      255,
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
    ));

    return AnimatedAlign(
      duration: duration,
      alignment: alignment,
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: color.value,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  // Converts
  Alignment get alignment => Alignment((position.x * 2) - 1, (position.y * 2) - 1);
}
