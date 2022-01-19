import 'package:flutter/widgets.dart';
import 'package:shared/models/position.dart';

extension PositionExt on Position {
  Rect getRect({required double tileSize}) => Rect.fromLTWH(
        (x - 1) * tileSize,
        (y - 1) * tileSize,
        tileSize,
        tileSize,
      );
}
