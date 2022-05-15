import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MeronDatabase {
  final String? id;
  final String? firstname;
  final String? middlename;
  final String? lastname;

  MeronDatabase({this.id, this.firstname, this.middlename, this.lastname});

  final database =
      openDatabase(join(getDatabasesPath().toString(), "flutterClassesProfiling.db"),
          onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE users (id TEXT PRIMARY KEY, firstname TEXT, middlename TEXT, lastname TEXT)');
  }, version: 1);

  Map<String, dynamic> toMap() {
    return {'id': id, 'firstname' : firstname, 'middlename': middlename, 'lastname': lastname};
  }

  //insert record
  Future<void> insertRecord(MeronDatabase data) async {
    final db = await database;

    await db.insert("users", data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //get record
  Future<List<MeronDatabase>> records() async {
    //connect to db.
    final db = await database;
    final List<Map<String, dynamic>> all = await db.query('users');

    return List.generate(all.length, (index) {
      return MeronDatabase(
          id: all[index]["id"],
          firstname: all[index]["firstname"],
          middlename: all[index]["middlename"],
          lastname: all[index]["lastname"],);
    });
  }

  //update record
  Future<void> update(MeronDatabase record, String oldId) async {
    //connect to db
    final db = await database;
    //update the given record.
    await db.update('users', record.toMap(),
        where: "id = ?", whereArgs: [oldId]);
  }

  //delete record
  Future<void> delete(String? id) async {
    //connect to db
    final db = await database;
    //delete
    await db.delete("users", where: "id = ?", whereArgs: [id]);
  }
}
