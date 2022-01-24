import 'package:equatable/equatable.dart';
import 'package:shared/models/models.dart';

class Participant extends Equatable {
  const Participant({
    required this.userId,
    required this.lastActive,
     this.position,
  });
  final String userId;
  final DateTime lastActive;
  final Position? position;

  Participant copyWith({
    String? userId,
    DateTime? lastActive,
    Position? position,
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
      position: map['position'] != null ? Position.fromMap(map['position']) : null,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        lastActive,
        position,
      ];

}
