import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;


class DBHelper{

  static Future<sql.Database> database() async{
    final dbpath =await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbpath,'places.db'),onCreate: (db, version) {
      db.execute('Create table user_places(id TEXT primary key, title TEXT,image TEXT)');
    },version: 1);

  }

  static Future<void> insert(String table, Map<String,Object> data) async{
    final db =await DBHelper.database();
    db.insert(table, data,conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String,dynamic>>> getData(String tableName) async {
    final db = await DBHelper.database();
    return await db.query(tableName);
  }
}