import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/person.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'organizational_chart.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE people (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        position TEXT,
        uplineId INTEGER,
        FOREIGN KEY (uplineId) REFERENCES people (id)
      )
    ''');
  }

  Future<int> insertPerson(Person person) async {
    Database db = await database;
    return await db.insert('people', person.toMap());
  }

  Future<List<Person>> getAllPeople() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('people');
    return List.generate(maps.length, (i) {
      return Person.fromMap(maps[i]);
    });
  }

  // Add other CRUD operations if needed (update, delete, etc.).
}
