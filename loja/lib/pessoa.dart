// class Pessoa {
//   int? id;
//   String nome;
//   int idade;

//   Pessoa({this.id, required this.nome, required this.idade});

//   // Converter um objeto Pessoa em um Map
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'nome': nome,
//       'idade': idade,
//     };
//   }

//   // Converter um Map em um objeto Pessoa
//   factory Pessoa.fromMap(Map<String, dynamic> map) {
//     return Pessoa(
//       id: map['id'],
//       nome: map['nome'],
//       idade: map['idade'],
//     );
//   }
// }