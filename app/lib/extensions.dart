import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/models/position.dart';

extension PositionExt on Position {
  Rect getRect({required double tileSize}) => Rect.fromLTWH(
        (x - 1) * tileSize,
        (y - 1) * tileSize,
        tileSize,
        tileSize,
      );
}

extension TimeStringExt on Duration {
  String toTimeString() {
    String format(int time1, int time2, [int? time3]) {
      if (time3 == null) {
        return "${time1.toString().padLeft(2, '0')}:${time2.toString().padLeft(2, '0')}";
      }
      return "${time1.toString().padLeft(2, '0')}:${time2.toString().padLeft(2, '0')}:${time3.toString().padLeft(2, '0')}";
    }

    if (inMinutes < 60) {
      return format(inMinutes, inSeconds % 60);
    } else if (inHours < 24) {
      return format(inHours, inMinutes % 60, inSeconds % 60);
    } else if (inDays == 1) {
      return "1 day";
    }
    return "$inDays days";
  }
}

extension AutoDisposeProviderRefEx on AutoDisposeProviderRef {
  void update<T>(AutoDisposeStateProvider<T> provider, T newValue) {
    read(provider.state).state = newValue;
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

extension ColorEx on Color {
  String toHexString() {
    return "#" + value.toRadixString(16).toUpperCase();
  }

  Color darken([int amount = 20]) {
    return Color.fromARGB(
      alpha,
      (red - amount).clamp(0, 255),
      (green - amount).clamp(0, 255),
      (blue - amount).clamp(0, 255),
    );
  }
}
