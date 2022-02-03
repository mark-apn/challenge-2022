import 'package:shared/models/pointer.dart';

extension ListEx<T> on List<T> {
  List<T> addOrReplace(bool Function(T element) comparator, T newValue) {
    final index = indexWhere(comparator);
    if (index == -1) {
      add(newValue);
      return this;
    } else {
      return replace(comparator, newValue);
    }
  }

  // * Replace object in list with new value
  List<T> replace<T>(bool Function(T element) comparator, T newValue) {
    return map<T>((value) {
      if (comparator(value as T)) {
        return newValue;
      } else {
        return value;
      }
    }).toList();
  }
}

extension PointerDisplayShapeExtension on PointerDisplayShape {
  String get assetPath {
    switch (this) {
      case PointerDisplayShape.circle:
        return "assets/svg/dot.svg";
      case PointerDisplayShape.arrow:
        return "assets/svg/cursor.svg";
      case PointerDisplayShape.amongus:
        return "assets/svg/amongus.svg";
      case PointerDisplayShape.peace:
        return "assets/svg/peace.svg";
      case PointerDisplayShape.wave:
        return "assets/svg/hand.svg";
      case PointerDisplayShape.android:
        return "assets/svg/android.svg";
      case PointerDisplayShape.flutter:
        return "assets/svg/flutter.svg";
    }
  }
}
