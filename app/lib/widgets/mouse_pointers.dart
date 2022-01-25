import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MousePointers extends HookWidget {
  const MousePointers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pointer = useState<Offset?>(null);

    return MouseRegion(
      cursor: SystemMouseCursors.none,
      opaque: false,
      onHover: (event) => pointer.value = event.localPosition,
      onExit: (_) => pointer.value = null,
      child: CustomPaint(
        painter: MousePointerPainter(pointer.value != null ? [pointer.value!] : []),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class MousePointerPainter extends CustomPainter {
  final List<Offset> pointers;

  MousePointerPainter(this.pointers);

  @override
  void paint(Canvas canvas, Size size) {
    final fillpaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;

    final strokepaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    for (final pointer in pointers) {
      canvas.drawCircle(pointer, 9.0, fillpaint);
      canvas.drawCircle(pointer, 10.0, strokepaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is MousePointerPainter && !(const ListEquality().equals(oldDelegate.pointers, pointers));
}
