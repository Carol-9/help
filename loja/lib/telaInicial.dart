import 'package:flutter/material.dart';
import 'package:loja/Fun%C3%A7%C3%B5es/botao-padrao.dart';
import 'package:loja/cadastro.dart';
import 'package:loja/login.dart';

class TelaInicial extends StatelessWidget {
  TelaInicial() {
    //initializeDateFormatting('pt_BR', 'http://localhost:57275/');
  }

  final String _img = "assets/LojaHeric.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: BotaoPadrao(texto: "Cadastrar", destino: TelaCadastro()),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: BotaoPadrao(texto: "Login", destino: Login())
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.black, border: Border.all()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(_img, fit: BoxFit.cover, height: 200),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => TelaCadastro(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
