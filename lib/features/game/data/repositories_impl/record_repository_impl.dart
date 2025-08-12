import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../domain/repositories/record_repository.dart';

class RecordRepositoryImpl implements RecordRepository {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    final path = join(await getDatabasesPath(), 'sudoku.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, _) => db.execute(
        'CREATE TABLE IF NOT EXISTS record (level INTEGER PRIMARY KEY, best INTEGER)',
      ),
    );
    return _db!;
  }

  @override
  Future<int?> getBestTime(int level) async {
    final database = await db;
    final result = await database.query(
      'record',
      where: 'level = ?',
      whereArgs: [level],
      limit: 1,
    );
    if (result.isNotEmpty) return result.first['best'] as int;
    return null;
  }

  @override
  Future<void> saveBestTime(int level, int seconds) async {
    final database = await db;
    await database.insert(
      'record',
      {'level': level, 'best': seconds},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
