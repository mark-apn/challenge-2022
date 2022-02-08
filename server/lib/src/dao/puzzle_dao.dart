import 'package:flutter_challenge_server/src/dao/dao.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';

abstract class IPuzzleDao extends IDao{
  Future<DbRow?> latest();
}

class PuzzleDao extends Dao implements IPuzzleDao {

  @override
  String get tableName => 'puzzles';

  @override
  Future<DbRow?> latest() async {
    final active = await execute(table.orderBy(Desc('created_at')).limit(1)) as List;
    return active.isEmpty ? null : (active.first as DbRow);
  }
}
