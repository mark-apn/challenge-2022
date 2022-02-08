import 'package:flutter_challenge_server/src/dao/dao.dart';

abstract class IParticipantDao extends IDao {}

class ParticipantDao extends Dao implements IParticipantDao {
  @override
  String get tableName => 'participants';
}
