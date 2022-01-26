import 'package:equatable/equatable.dart';
import 'package:shared/models/pointer.dart';

class Participant extends Equatable {
  Participant({
    required this.userId,
    required this.lastActive,
    this.pointer = null,
  });

  final String userId;
  final DateTime lastActive;
  final ParticipantPointer? pointer;

  Participant copyWith({
    String? userId,
    DateTime? lastActive,
    ParticipantPointer? pointer,
  }) {
    return Participant(
      userId: userId ?? this.userId,
      lastActive: lastActive ?? this.lastActive,
      pointer: pointer ?? this.pointer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'lastActive': lastActive.millisecondsSinceEpoch,
      'pointer': pointer?.toMap(),
    };
  }

  factory Participant.fromMap(Map<String, dynamic> map) {
    return Participant(
      userId: map['userId'] ?? '',
      lastActive: DateTime.fromMillisecondsSinceEpoch(map['lastActive']),
      pointer: map['pointer'] != null ? ParticipantPointer.fromMap(map['pointer']) : null,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        lastActive,
        pointer,
      ];
}
