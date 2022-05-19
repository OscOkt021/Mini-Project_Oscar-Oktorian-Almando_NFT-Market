import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    //melakukan inisialisasi data
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // final path = join(databasePath, 'nft_database.db');
    final path = join(databasePath, 'nft_database_dua.db');

    return await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE creator(id INTEGER PRIMARY KEY AUTOINCREMENT, nickName TEXT NOT NULL, realName TEXT NOT NULL, imgProfile TEXT NOT NULL, about TEXT NOT NULL)',
        );

        await db.execute(
          // 'CREATE TABLE content(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, imgUrl TEXT NOT NULL, description TEXT NOT NULL, price DOUBLE NOT NULL, creatorId INTEGER NOT NULL, FOREIGN KEY (creatorId) REFERENCES creator(id) ON DELETE SET NULL)',
          'CREATE TABLE content(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, imgUrl TEXT NOT NULL, description TEXT NOT NULL, price DOUBLE NOT NULL, creatorId INTEGER NOT NULL, dateCreated INTEGER NOT NULL, category TEXT NOT NULL, FOREIGN KEY (creatorId) REFERENCES creator(id) ON DELETE SET NULL)',
        );
      },
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  // Future<void> _onCreate(Database db, int version) async {}

  Future<int> insertCreator(Creator creator) async {
    final db = await _databaseService.database;

    final hasil = await db.insert(
      'creator',
      creator.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return hasil;
  }

  Future<int> insertContent(Content content) async {
    final db = await _databaseService.database;

    final hasil = await db.insert(
      'content',
      content.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return hasil;
  }

  Future<Creator> creator(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query('creator', where: 'id = ?', whereArgs: [id]);
    return Creator.fromMap(maps[0]);
  }

  Future<Content> certainContent(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query('content', where: 'id = ?', whereArgs: [id]);
    return Content.fromMap(maps[0]);
  }

  Future<List<Creator>> creators() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('creator');
    return List.generate(maps.length, (index) => Creator.fromMap(maps[index]));
  }

  Future<List<Content>> content() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('content');
    return List.generate(maps.length, (index) => Content.fromMap(maps[index]));
  }

  Future<List<Content>> contentByCategory() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query('content', distinct: true, groupBy: "category");
    return List.generate(maps.length, (index) => Content.fromMap(maps[index]));
  }

  Future<List<Content>> contentWithId(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query('content', where: 'creatorId = ?', whereArgs: [id]);
    return List.generate(maps.length, (index) => Content.fromMap(maps[index]));
  }

  Future<void> updateCreator(Creator creator) async {
    final db = await _databaseService.database;

    await db.update(
      'creator',
      creator.toMap(),
      where: 'id = ?',
      whereArgs: [creator.id],
    );
  }

  Future<void> updateContent(Content content) async {
    final db = await _databaseService.database;

    await db.update(
      'content',
      content.toMap(),
      where: 'id = ?',
      whereArgs: [content.id],
    );
  }

  Future<void> deleteCreator(int id) async {
    final db = await _databaseService.database;

    await db.delete(
      'creator',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteContent(int id) async {
    final db = await _databaseService.database;

    await db.delete(
      'content',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
