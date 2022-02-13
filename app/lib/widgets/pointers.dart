import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/extensions.dart';
import 'package:flutter_challenge/hooks/use_throttle.dart';
import 'package:flutter_challenge/prefs.dart';
import 'package:flutter_challenge/state/konami_state.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_challenge/state/puzzle_viewmodel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';
import 'package:simple_shadow/simple_shadow.dart';

class Pointers extends HookConsumerWidget {
  const Pointers({
    Key? key,
    required this.boardSize,
  }) : super(key: key);

  final double boardSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cheatEnabled = ref.watch(konamiModeEnabledProvider);
    final pointerSettings = ref.watch(myPointerSettingsProvider);
    final mousePosition = useState<Offset?>(null);
    final isUpdated = useState(false);

    // * Only send max 10 position updates per second
    useThrottle(
      isActive: isUpdated,
      duration: const Duration(milliseconds: 100),
      callback: () {
        PuzzleVm.instance.updatePointerPosition(mousePosition.value!);
        isUpdated.value = false;
      },
    );

    final userId = Prefs.instance.getString(kUserId);
    final otherPointers = ref.watch(
      puzzleProvider.select(
        (state) => state.puzzle.participants
            .whereNot((p) => p.userId == userId)
            .where((p) => p.pointer.position != null)
            .map((p) => p.pointer)
            .toList(),
      ),
    );

    final ParticipantPointer? myPointer;
    if (mousePosition.value != null) {
      myPointer = ParticipantPointer(
        position: PointerPosition(
          x: mousePosition.value!.dx,
          y: mousePosition.value!.dy,
        ),
        settings: pointerSettings.copyWith(
          size: cheatEnabled ? 200 : null,
        ),
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
        mousePosition.value = Offset(
          localPosition.dx / boardSize,
          localPosition.dy / boardSize,
        );
        isUpdated.value = true;
      },
      onExit: (_) {
        mousePosition.value = const Offset(-100, -100);
        isUpdated.value = true;
      },
      child: Stack(
        children: [
          ...otherPointers.map((p) => Pointer(pointer: p)).toList(),
          if (myPointer != null)
            Pointer(
              pointer: myPointer,
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
    required this.pointer,
    this.duration = const Duration(milliseconds: 100),
  }) : super(key: key);

  final ParticipantPointer pointer;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: duration,
      alignment: alignment,
      child: SimpleShadow(
        color: Colors.white,
        child: SvgPicture.asset(
          pointer.settings.shape.assetPath,
          width: pointer.settings.size,
          height: pointer.settings.size,
          color: HexColor(pointer.settings.colorHex),
        ),
      ),
    );
  }

  // Converts
  Alignment get alignment => Alignment(
        (pointer.position!.x * 2) - 1,
        (pointer.position!.y * 2) - 1,
      );
}
