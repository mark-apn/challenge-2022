import 'package:equatable/equatable.dart';

class ParticipantPointer extends Equatable {
  const ParticipantPointer({
    this.position,
    required this.settings,
  });
  final PointerPosition? position;
  final PointerDisplaySettings settings;

  @override
  List<Object?> get props => [position, settings];

  factory ParticipantPointer.initial() => ParticipantPointer(settings: PointerDisplaySettings.initial());

  ParticipantPointer copyWith({
    PointerPosition? position,
    PointerDisplaySettings? settings,
  }) {
    return ParticipantPointer(
      position: position ?? this.position,
      settings: settings ?? this.settings,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'position': position?.toMap(),
      'settings': settings.toMap(),
    };
  }

  factory ParticipantPointer.fromMap(Map<String, dynamic> map) {
    return ParticipantPointer(
      position: map['position'] != null ? PointerPosition.fromMap(map['position']) : map['position'],
      settings: PointerDisplaySettings.fromMap(map['settings']),
    );
  }
}

class PointerPosition extends Equatable {
  const PointerPosition({
    required this.x,
    required this.y,
  });

  final double x;
  final double y;

  @override
  List<Object> get props => [x, y];

  PointerPosition copyWith({
    double? x,
    double? y,
  }) {
    return PointerPosition(
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'x': x,
      'y': y,
    };
  }

  factory PointerPosition.fromMap(Map<String, dynamic> map) {
    return PointerPosition(
      x: map['x']?.toDouble() ?? 0.0,
      y: map['y']?.toDouble() ?? 0.0,
    );
  }
}

class PointerDisplaySettings extends Equatable {
  const PointerDisplaySettings({
    required this.shape,
    required this.size,
    required this.colorHex,
  });

  factory PointerDisplaySettings.initial() => PointerDisplaySettings(
        colorHex: "#4B4B4B",
        shape: PointerDisplayShape.arrow,
        size: 30,
      );

  final PointerDisplayShape shape;
  final double size;
  final String colorHex;

  @override
  List<Object> get props => [shape, size, colorHex];

  PointerDisplaySettings copyWith({
    PointerDisplayShape? shape,
    double? size,
    String? colorHex,
  }) {
    return PointerDisplaySettings(
      shape: shape ?? this.shape,
      size: size ?? this.size,
      colorHex: colorHex ?? this.colorHex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'shape': shape.index,
      'size': size,
      'colorHex': colorHex,
    };
  }

  factory PointerDisplaySettings.fromMap(Map<String, dynamic> map) {
    return PointerDisplaySettings(
      shape: PointerDisplayShape.values[map['shape'].toInt()],
      size: map['size'].toDouble(),
      colorHex: map['colorHex'].toString(),
    );
  }
}

enum PointerDisplayShape {
  circle,
  arrow,
  amongus,
  peace,
  wave,
  android,
  flutter,
}
