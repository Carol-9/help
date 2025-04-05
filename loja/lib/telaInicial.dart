import 'package:flutter/material.dart';
import 'package:loja/cadastro.dart';
import 'package:loja/login.dart';

class TelaInicial extends StatelessWidget {
  final String _img = "../assets/LojaHeric.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaCadastro()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 14, 47, 157),
                foregroundColor: Colors.white, // Cor do texto corrigida para melhor visibilidade
              ),
              child: Text("Cadastrar"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => login()), // Nome da classe corrigido
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 14, 47, 157),
                foregroundColor: Colors.white,
              ),
              child: Text("Login"),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(_img, fit: BoxFit.cover, height: 400),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
