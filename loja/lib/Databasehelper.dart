import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'usuarios.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
await db.execute('''
  CREATE TABLE IF NOT EXISTS usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT UNIQUE,
    senha TEXT
  )
''');

  }

Future<int> cadastrarUsuario(String nome, String senha) async {
  final db = await database;
  try {
    return await db.insert('usuarios', {'nome': nome, 'senha': senha});
  } catch (e) {
    return -1;
  }
}


  Future<bool> login(String nome, String senha) async {
    final db = await database;
    final result = await db.query(
      'usuarios',
      where: 'nome = ? AND senha = ?',
      whereArgs: [nome, senha],
    );
    return result.isNotEmpty;
  }
}
