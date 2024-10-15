
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper
{
  //database name and version
  static final databaseName = "topstech.db";
  static final databaseVersion = 1;

  //table names
  static final table = 'Signup';

  static final cId = 'id';
  static final cfname = 'fname';
  static final clname = 'lname';
  static final cemail = 'email';
  static final cpass = 'pass';
  static final crepass = 'repass';

  //private constructor
  Dbhelper._privateConstructor();

  //database object
  static Database? _database;

  //initialization
  static final Dbhelper instance = Dbhelper._privateConstructor();

  Future<Database> get database async => _database ??= await _initDatabase();



  _initDatabase() async
  {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, databaseName);
    return await openDatabase
      (
        path, version: databaseVersion, onCreate: onCreate);
  }

  //database get and initialize
  Future<Database?> get database1 async
  {
    if (_database == null)
    {
      _database = await _initDatabase();
    }
    return _database;
  }


  FutureOr<void> onCreate(Database db, int version) async
  {
    await db.execute('''
          CREATE TABLE $table (
            $cId INTEGER PRIMARY KEY,
            $cfname TEXT NOT NULL,
            $clname TEXT NOT NULL, 
            $cemail TEXT NOT NULL, 
            $cpass TEXT NOT NULL, 
            $crepass TEXT NOT NULL 
          )
          ''');

  }

  Future<int>insert(Map<String,dynamic>row) async
  {
    Database? db = await instance.database;
    return await db.insert(table, row);
  }

  Future<Map<String, dynamic>?> getUser(String email) async
  {
    final db = await database;
    List<Map<String, dynamic>> result =
    await db.query('Signup', where: "email = ?", whereArgs: [email]);
    return result.isNotEmpty ? result.first : null;
  }
}
