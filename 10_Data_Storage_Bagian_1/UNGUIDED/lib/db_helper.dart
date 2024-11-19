import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // Singleton Instance
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  // Getter untuk database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Inisialisasi database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'biodata.db'); // Path database
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate, // Membuat tabel saat pertama kali database dibuat
    );
  }

  // Membuat tabel SQLite
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE biodata (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        nim TEXT,
        alamat TEXT,
        hobi TEXT
      )
    ''');
  }

  // Fungsi CRUD
  // Insert data
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert(
        'my_table', row); // Ganti 'my_table' sesuai nama tabel di SQLite Anda.
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query(
        'my_table'); // Ganti 'my_table' sesuai nama tabel di SQLite Anda.
  }

  // Update data
  Future<int> update(Map<String, dynamic> data) async {
    final db = await database;
    int id = data['id'];
    return await db.update('biodata', data, where: 'id = ?', whereArgs: [id]);
  }

  // Delete data
  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete('biodata', where: 'id = ?', whereArgs: [id]);
  }
}
