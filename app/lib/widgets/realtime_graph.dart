import 'dart:math';

import 'package:flutter/material.dart';

class RealtimeGraphController {
  final listeners = <VoidCallback>[];
  final dataPoints = <DateTime>[];

  void addDataPoint() {
    dataPoints.add(DateTime.now());
    _updateListeners();
  }

  void removeDataPoint() {
    dataPoints.removeLast();
    _updateListeners();
  }

  void _updateListeners() {
    for (var listener in listeners) {
      Future.microtask(listener);
    }
  }

  void addListener(VoidCallback listener) {
    listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    listeners.remove(listener);
  }

  void dispose() {
    listeners.clear();
  }

  void removeOlderThan(Duration visibleTimeFrame) {
    final oldLength = dataPoints.length;

    final now = DateTime.now();
    dataPoints.removeWhere((element) {
      final timeDiff = now.difference(element).inMilliseconds;
      return timeDiff > visibleTimeFrame.inMilliseconds;
    });

    final newLength = dataPoints.length;

    if (newLength != oldLength) {
      _updateListeners();
    }
  }
}

class RealtimeGraph extends StatefulWidget {
  const RealtimeGraph({
    Key? key,
    required this.controller,
    required this.verticalLabel,
    required this.horizontalLabel,
    this.visibleTimeFrame = const Duration(seconds: 10),
    this.labelStyle,
    this.axisTextStyle,
  }) : super(key: key);

  final RealtimeGraphController controller;
  final String verticalLabel;
  final String horizontalLabel;
  final Duration visibleTimeFrame;
  final TextStyle? labelStyle;
  final TextStyle? axisTextStyle;

  @override
  State<RealtimeGraph> createState() => _RealtimeGraphState();
}

class _RealtimeGraphState extends State<RealtimeGraph> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // To calculate stable rolling time for the gridlines
  final startTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RealtimeGraphPainter(
        listenable: _controller,
        controller: widget.controller,
        startTime: startTime,
        visibleTimeFrame: widget.visibleTimeFrame,
        verticalLabel: widget.verticalLabel,
        horizontalLabel: widget.horizontalLabel,
        labelStyle: widget.labelStyle ?? const TextStyle(color: Colors.black, fontSize: 10),
        axisTextStyle: widget.axisTextStyle ?? const TextStyle(color: Colors.black, fontSize: 10),
      ),
      child: const SizedBox.expand(),
    );
  }
}

class RealtimeGraphPainter extends CustomPainter {
  final pointsPainter = Paint()
    ..color = Colors.blue
    ..strokeWidth = 5
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke;

  final boxPainter = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke;

  final gridPainter = Paint()
    ..color = Colors.grey
    ..style = PaintingStyle.fill;

  final Animation listenable;
  final RealtimeGraphController controller;
  final Duration visibleTimeFrame;
  final DateTime startTime;
  final String verticalLabel;
  final String horizontalLabel;
  final TextStyle labelStyle;
  final TextStyle axisTextStyle;

  double gridOffset = 0;
  num maxY = 0;
  Map<int, int> points = {};
  List<double> lines = [];

  final labelSize = 15.0;
  final divisions = 10;

  RealtimeGraphPainter({
    required this.controller,
    required this.visibleTimeFrame,
    required this.startTime,
    required this.listenable,
    required this.verticalLabel,
    required this.horizontalLabel,
    required this.labelStyle,
    required this.axisTextStyle,
  }) : super(repaint: listenable);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset(labelSize, 0) & Size(size.width - labelSize, size.height),
      boxPainter,
    );

    _updateGridOffset();
    _updatePoints();
    _drawLabels(canvas, size);
    _drawXAxisLegend(canvas, size);
    _drawYAxisLegend(canvas, size);

    for (var i = 1; i < 12; i++) {
      final width = (size.width - labelSize) / divisions;
      final line = i * width;
      final offset = line - (gridOffset * width);
      final lineOffset = max(labelSize, min(size.width, offset));
      canvas.drawLine(Offset(lineOffset, 0), Offset(lineOffset, size.height), gridPainter);

      if (points.containsKey(i)) {
        final point = Offset(offset, size.height - ((size.height / (maxY + 1)) * points[i]!));
        canvas.drawRect(
          Rect.fromPoints(
            Offset(max(labelSize, min(size.width, point.dx - 5)), point.dy),
            Offset(max(labelSize, min(size.width, point.dx + 5)), size.height),
          ),
          gridPainter,
        );
      }
    }
  }

  void _drawLabels(Canvas canvas, Size size) {
    final sizePerLabel = size.height / (maxY + 1);

    // X axis labels
    for (int i = 0; i <= (maxY + 1); i++) {
      final textSpan = TextSpan(text: '$i', style: axisTextStyle);
      final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
      textPainter.layout(minWidth: 0, maxWidth: labelSize);
      const xCenter = 0.0;
      final yCenter = size.height - (sizePerLabel * i) - 10;
      final offset = Offset(xCenter, yCenter);
      textPainter.paint(canvas, offset);
    }

    // Y axis labels
    for (int i = divisions; i >= 0; i--) {
      final textSpan = TextSpan(text: '$i', style: axisTextStyle);
      final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
      textPainter.layout(minWidth: 0, maxWidth: labelSize);
      final xCenter = size.width - ((size.width - labelSize) / divisions * i);
      final yCenter = size.height;
      final offset = Offset(xCenter, yCenter);
      textPainter.paint(canvas, offset);
    }
  }

  void _updatePoints() {
    final now = DateTime.now();

    // get the points from the controller
    // process the points to get the x and y values
    points.clear();
    maxY = 0;

    for (var point in controller.dataPoints) {
      final millisecondsPerLine = visibleTimeFrame.inMilliseconds / divisions;
      final timeDiff = now.difference(point).inMilliseconds;
      final diffWithGridCorrection = timeDiff - (gridOffset * millisecondsPerLine);

      final bucket = divisions - (diffWithGridCorrection / millisecondsPerLine).floor();

      final bucketSize = (points[bucket] ?? 0) + 1;

      if (bucketSize > maxY) {
        maxY = bucketSize;
      }

      points[bucket] = bucketSize;
    }

    // remove points outside the visible area
    controller.removeOlderThan(visibleTimeFrame + const Duration(seconds: 1));
  }

  void _updateGridOffset() {
    // add X lines to the grid
    final now = DateTime.now();
    final millisecondsPerLine = visibleTimeFrame.inMilliseconds / divisions;
    gridOffset = (now.difference(startTime).inMilliseconds % millisecondsPerLine) / millisecondsPerLine;
  }

  void _drawXAxisLegend(Canvas canvas, Size size) {
    final textSpan = TextSpan(text: verticalLabel, style: labelStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout(minWidth: 0, maxWidth: 100);
    final offset = -Offset(textPainter.size.width / 2, textPainter.size.height / 2);

    canvas.save();

    canvas.translate(0, size.height/2);
    canvas.rotate(-pi / 2);
    textPainter.paint(canvas, offset - const Offset(0, 10));
    canvas.translate(0, -size.height/2);

    canvas.restore();
  }

  void _drawYAxisLegend(Canvas canvas, Size size) {
    final textSpan = TextSpan(text: horizontalLabel, style: labelStyle);
    final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: 100);
    final xCenter = labelSize + (size.width / 2) - textPainter.size.width / 2;
    final yCenter = size.height + 15;
    final offset = Offset(xCenter, yCenter);

    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; //This realtime graph is always repainting
  }
}
