import 'package:flutter_challenge_server/env.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';

// * Is responsible for the connection to the database.
// * Casts all RethinkDB dynamics to known types.
// * Provides a simple interface to the database.

typedef Inserter = Insert Function(dynamic records, [dynamic options]);
typedef DbRow = Map<String, dynamic>;

abstract class IDao {
  String get tableName;

  Table get table;

  Inserter get dbInsert;

  Update dbUpdate(String id, Map<String, dynamic> updates);

  Get dbRead(String id);

  Changes dbListen(String id);

  Future<bool> insert(DbRow row);

  Future<DbRow?> read(String id);

  Future<DbRow> merge(String id, DbRow partial);

  Future<DbRow> update(String id, DbRow row);

  Future<AtomFeed?> readFeed(String id);

  Future<dynamic> execute(RqlMethodQuery query);
}


abstract class Dao implements IDao{
  final _r = RethinkDb();
  String get hostName => Env.instance.isLocal ? 'localhost' : 'rethinkdb';

  Connection? _connectionCache;

  Future<Connection> get _connection async {
    return _connectionCache ??= await _r.connect(
      db: 'puzzles',
      host: hostName,
    );
  }

  @override
  String get tableName;

  @override
  Table get table => _r.table(tableName);

  @override
  Inserter get dbInsert => table.insert;

  @override
  Update dbUpdate(String id, Map<String, dynamic> updates) => table.get(id).update(updates);

  @override
  Get dbRead(String id) => table.get(id);

  @override
  Changes dbListen(String id) => table.get(id).changes();

  @override
  Future<bool> insert(DbRow row) async {
    final result = await execute(dbInsert(row)) as Map;
    return result['inserted'] == 1;
  }

  @override
  Future<DbRow?> read(String id) async {
    final result = await execute(dbRead(id));
    return result as DbRow?;
  }

  @override
  Future<DbRow> merge(String id, DbRow partial) async {
    final result = await execute(dbRead(id).update((row){
      return row.merge(partial);
    }));
    return result as DbRow;
  }

  @override
  Future<DbRow> update(String id, DbRow row) async {
    final result = await execute(dbUpdate(id, row));
    return result as DbRow;
  }

  @override
  Future<AtomFeed?> readFeed(String id) async {
    final result = await execute(dbListen(id));
    return result as AtomFeed;
  }

  @override
  Future<dynamic> execute(RqlMethodQuery query) async {
    return query.run((await _connection));
  }
}
