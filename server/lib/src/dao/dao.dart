import 'package:flutter_challenge_server/env.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';

// * Is responsible for the connection to the database.
// * Casts all RethinkDB dynamics to known types.
// * Provides a simple interface to the database.

typedef Inserter = Insert Function(dynamic records, [dynamic options]);
typedef DbRow = Map<String, dynamic>;

abstract class Dao {
  final _r = RethinkDb();
  String get hostName => Env.instance.isLocal ? 'localhost' : 'rethinkdb';

  Connection? _connectionCache;

  Future<Connection> get _connection async {
    return _connectionCache ??= await _r.connect(
      db: 'puzzles',
      host: hostName,
    );
  }

  String get tableName;

  Table get table => _r.table(tableName);

  Inserter get dbInsert => table.insert;

  Update dbUpdate(String id, Map<String, dynamic> updates) => table.get(id).update(updates);

  Get dbRead(String id) => table.get(id);

  Changes dbListen(String id) => table.get(id).changes();

  Future<bool> insert(DbRow row) async {
    final result = await execute(dbInsert(row)) as Map;
    return result['inserted'] == 1;
  }

  Future<DbRow> read(String id) async {
    final result = await execute(dbRead(id));
    return result as DbRow;
  }

  Future<DbRow> update(String id, DbRow row) async {
    final result = await execute(dbUpdate(id, row));
    return result as DbRow;
  }

  Future<AtomFeed?> readFeed(String id) async {
    final result = await execute(dbListen(id));
    return result as AtomFeed;
  }

  Future<dynamic> execute(RqlMethodQuery query) async {
    return query.run((await _connection));
  }
}
