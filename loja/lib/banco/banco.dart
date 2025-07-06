// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class Banco {
//   static final Banco _instance=Banco._internal();
//   static Database? _database;

//   factory Banco(){
//     return _instance;
//   }

//   Banco._internal();

//   Future<Database> get database async{
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }


//   //Inicializar o banco 
//   Future<Database> _initDatabase() async{
//     String dbPath = await getDatabasesPath();
//     return openDatabase(
//       join(dbPath, 'app_database.db'),
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }

//   // criar as tabelas
//   Future _onCreate(Database db, int version) async{
//   await db.execute(
// 'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)'
//   );
//   }

//   // Metodo para fechar o banco de dados (caso seja necessario)
//     Future close()async{
//       final db=await database;
//       db.close();
//     }
// }