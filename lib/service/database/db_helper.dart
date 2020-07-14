import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class DbHelper {
  static Database _db;
  static Future<void> initDB(
      int version, String name, List<String> tables) async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + '/' + name;
      _db = await openDatabase(_path, version: version,
          onCreate: (db, version) async {
        Batch _batch = db.batch();
        tables.forEach((_createTablesQuery) {
          _batch.execute(_createTablesQuery);
        });
        await _batch.commit();
      }, onUpgrade: (db, oldVersion, newVersion) async {
        if (newVersion > oldVersion) {
          db.execute("ALTER TABLE USER ADD COLUMN newCol TEXT;");
          print("Upgrade");
        }
      });
    } catch (ex) {
      print(ex);
    }
  }

  static Future<int> insert(String table, model) async =>
      await _db.insert(table, model.toMap());

  static Future<int> update(
          String table, model, String whereColumn, List arguments) async =>
      await _db.update(table, model.toMap(),
          where: whereColumn, whereArgs: arguments);
}
