import 'dart:async';

import 'package:rethink_db_ns/rethink_db_ns.dart';

// * Is responsible for the connection to the database.
// * Casts all RethinkDB dynamics to known types.
// * Provides a simple interface to the database.

typedef DbRow = Map<String, dynamic>;

class PuzzleDao {
  final _r = RethinkDb();

  Connection? _connectionCache;
  Future<Connection> get _connection async {
    return _connectionCache ??= await _r.connect(
      db: 'puzzles',
      host: 'rethinkdb', // docker container identifier
    );
  }

  Table get _table => _r.table('puzzles');

  Future<bool> insert(DbRow row) async {
    final result = await _run(_table.insert(row)) as Map;
    return result['inserted'] == 1;
  }

  Future<DbRow> read(String id) async {
    final result = await _run(_table.get(id));
    return result as DbRow;
  }

  Future<DbRow> update(String id, DbRow row) async {
    final result = await _run(_table.get(id).update(row));
    return result as DbRow;
  }

  Future<AtomFeed?> readFeed(String id) async {
    final result = await _run(_table.get(id).changes());
    return result as AtomFeed;
  }

  Future<DbRow?> latest() async {
    final active = await _run(_table.orderBy(Desc('created_at')).limit(1)) as List;
    return active.isEmpty ? null : (active.first as DbRow);
  }

  Future<dynamic> _run(RqlMethodQuery query) async {
    return query.run((await _connection));
  }
}
