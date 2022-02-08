import 'package:flutter_challenge_server/di.dart';
import 'package:flutter_challenge_server/generated/puzzle/v1/puzzle.pb.dart';
import 'package:flutter_challenge_server/src/dao/participant_dao.dart';
import 'package:flutter_challenge_server/src/repository/repository.dart';
import 'package:shared/models/models.dart';

class ParticipantRepo extends Repository<IParticipantDao> {
  static ParticipantRepo get instance => DI.inject();

  Future<Participant> getParticipant(String userId) async {
    final row = await dao.read(userId);

    if (row == null) {
      final p = Participant.fromUserId(userId);
      await dao.insert({
        'id': userId,
        ...p.toMap(),
      });
      return p;
    } else {
      return Participant.fromMap(row);
    }
  }

  Future<bool> updatePointerSettings(String userId, PointerSettingsMessage settings) async {
    final participant = await getParticipant(userId);
    final pointerSettings = PointerDisplaySettings(
      colorHex: settings.colorHex,
      size: settings.size,
      shape: PointerDisplayShape.values[settings.shape.value - 1],
    );

    final updated = participant.copyWith(pointer: participant.pointer.copyWith(settings: pointerSettings));
    final result = await dao.update(userId, updated.toMap());

    return result['replaced'] == 1;
  }
}
