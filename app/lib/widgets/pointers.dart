import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/extensions.dart';
import 'package:flutter_challenge/hooks/use_throttle.dart';
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
    final pointerSettings = ref.watch(myPointerSettingsProvider);
    final mousePosition = useState<Offset?>(null);
    final isUpdated = useState(false);

    // * Only send max 10 position updates per second
    useThrottle(
      isActive: isUpdated,
      duration: const Duration(milliseconds: 1),
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
        settings: pointerSettings,
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
      child: Container(
        width: pointer.settings.size,
        height: pointer.settings.size,
        decoration: ShapeDecoration(
          color: HexColor(pointer.settings.colorHex),
          shadows: const [
            BoxShadow(color: Colors.black45, blurRadius: 4.0, offset: Offset(2, 2)),
          ],
          shape: pointer.settings.shape == PointerDisplayShape.circle
              ? const CircleBorder(side: BorderSide())
              : const _ArrowShape(side: BorderSide()),
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

class _ArrowShape extends OutlinedBorder {
  /// Create an arrow border.
  ///
  /// The [side] argument must not be null.
  const _ArrowShape({BorderSide side = BorderSide.none}) : super(side: side);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  ShapeBorder scale(double t) => _ArrowShape(side: side.scale(t));

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    final size = rect.size;
    path.moveTo(size.width * 0.40, size.height * 0.94);
    path.lineTo(size.width * 0.05, size.height * 0.05);
    path.lineTo(size.width * 0.94, size.height * 0.51);
    path.lineTo(size.width * 0.58, size.height * 0.64);
    path.close();

    return path.shift(rect.topLeft);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    final size = rect.size;
    path.moveTo(size.width * 0.40, size.height * 0.94);
    path.lineTo(size.width * 0.05, size.height * 0.05);
    path.lineTo(size.width * 0.94, size.height * 0.51);
    path.lineTo(size.width * 0.58, size.height * 0.64);
    path.close();

    return path.shift(rect.topLeft);
  }

  @override
  _ArrowShape copyWith({BorderSide? side}) => _ArrowShape(side: side ?? this.side);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        canvas.drawPath(
          getInnerPath(rect),
          side.toPaint(),
        );
    }
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is _ArrowShape && other.side == side;
  }

  @override
  int get hashCode => side.hashCode;
}
