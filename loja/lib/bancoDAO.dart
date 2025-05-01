// import 'package:loja/banco.dart';
// import 'package:sqflite/sqflite.dart';
// import 'pessoa.dart';



// class PessoaDAO {
//   final Banco _dbHelper = Banco();

//   // Inserir uma pessoa
//   Future<void> insertPessoa(Pessoa pessoa) async {
//     final db = await _dbHelper.database;
//     await db.insert('pessoa', pessoa.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   // Atualizar uma pessoa
//   Future<void> updatePessoa(Pessoa pessoa) async {
//     final db = await _dbHelper.database;
//     await db.update('pessoa', pessoa.toMap(),
//         where: 'id = ?', whereArgs: [pessoa.id]);
//   }

//   // Deletar uma pessoa
//   Future<void> deletePessoa(int id) async {
//     final db = await _dbHelper.database;
//     await db.delete('pessoa', where: 'id = ?', whereArgs: [id]);
//   }

//   // Listar todas as pessoas
//   Future<List<Pessoa>> listPessoas() async {
//     final db = await _dbHelper.database;
//     final List<Map<String, dynamic>> maps = await db.query('pessoa');
//     return List.generate(maps.length, (i) {
//       return Pessoa.fromMap(maps[i]);
//     });
//   }
// }