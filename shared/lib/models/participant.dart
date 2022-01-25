
import 'package:equatable/equatable.dart';

class Participant extends Equatable {
  const Participant({
    required this.userId,
    required this.lastActive,
    this.position,
  });
  final String userId;
  final DateTime lastActive;
  final MousePosition? position;

  Participant copyWith({
    String? userId,
    DateTime? lastActive,
    MousePosition? position,
  }) {
    return Participant(
      userId: userId ?? this.userId,
      lastActive: lastActive ?? this.lastActive,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'lastActive': lastActive.millisecondsSinceEpoch,
      'position': position?.toMap(),
    };
  }

  factory Participant.fromMap(Map<String, dynamic> map) {
    return Participant(
      userId: map['userId'] ?? '',
      lastActive: DateTime.fromMillisecondsSinceEpoch(map['lastActive']),
      position: map['position'] != null ? MousePosition.fromMap(map['position']) : null,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        lastActive,
        position,
      ];
}

class MousePosition extends Equatable {
  const MousePosition({
    required this.x,
    required this.y,
  });

  final double x;
  final double y;

  @override
  List<Object> get props => [x, y];

  MousePosition copyWith({
    double? x,
    double? y,
  }) {
    return MousePosition(
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

  factory MousePosition.fromMap(Map<String, dynamic> map) {
    return MousePosition(
      x: map['x']?.toDouble() ?? 0.0,
      y: map['y']?.toDouble() ?? 0.0,
    );
  }
}
