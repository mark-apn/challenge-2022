import 'package:equatable/equatable.dart';
import 'package:shared/models/pointer.dart';

class Participant extends Equatable {
  Participant({
    required this.userId,
    DateTime? lastActive,
    ParticipantPointer? pointer,
  })  : lastActive = lastActive ?? DateTime.now(),
        pointer = pointer ?? ParticipantPointer.initial();

  factory Participant.fromUserId(String userId) => Participant(userId: userId);

  final String userId;
  final DateTime lastActive;
  final ParticipantPointer pointer;

  Participant copyWith({
    String? userId,
    ParticipantPointer? pointer,
  }) {
    return Participant(
      userId: userId ?? this.userId,
      lastActive: DateTime.now(),
      pointer: pointer ?? this.pointer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'lastActive': lastActive.millisecondsSinceEpoch,
      'pointer': pointer.toMap(),
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
