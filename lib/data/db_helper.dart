// db/database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'data_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'recipes.db');
    _database = await openDatabase(path);
    return _database!;
  }

  Future<List<DataModel>> getAllDataModels() async {
    final db = await database;
    final result = await db.query('DataModels', orderBy: 'title ASC');
    return result.map((map) => DataModel.fromMap(map)).toList();
  }

  Future<List<DataModel>> getDataModelsByCategory(String category) async {
    final db = await database;
    final result = await db.query(
      'DataModels',
      where: 'category = ?',
      whereArgs: [category],
    );
    return result.map((map) => DataModel.fromMap(map)).toList();
  }

  Future<List<DataModel>> getQuickDataModels() async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT * FROM DataModels WHERE prep_time <= ?',
      [20],
    );
    return result.map((map) => DataModel.fromMap(map)).toList();
  }

  Future<List<DataModel>> getBreakfastItems() {
    return getDataModelsByCategory("breakfast");
  }

  Future<List<DataModel>> getLunchItems() {
    return getDataModelsByCategory("lunch");
  }

  Future<List<DataModel>> getDinnerItems() {
    return getDataModelsByCategory("dinner");
  }

  Future<List<DataModel>> getSnacksItems() {
    return getDataModelsByCategory("snacks");
  }
}
