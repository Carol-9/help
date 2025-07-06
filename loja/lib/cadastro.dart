import 'package:flutter/material.dart';
import 'package:loja/inicio.dart';
import 'package:loja/databasehelper.dart';
import 'package:flutter/services.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _nomeController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _visivel = true;

  void _cadastrar() async {
    String nome = _nomeController.text.trim();
    String senha = _senhaController.text.trim();

    if (nome.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor, preencha todos os campos")),
      );
      return;
    }

    try {
      await DatabaseHelper().cadastrarUsuario(nome, senha);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Cadastro realizado com sucesso!")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Inicio()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao cadastrar: usuário já existe.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Cadastro",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 255, 245, 245),
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Nome",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: _visivel,
              controller: _senhaController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _visivel = !_visivel;
                    });
                  },
                  icon:
                      _visivel
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                ),
                labelText: "Senha",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,  //  apenas números
                LengthLimitingTextInputFormatter(6),    //  6 dígitos
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _cadastrar, child: Text("Próximo")),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Voltar"),
            ),
          ],
        ),
      ),
    );
  }
}
