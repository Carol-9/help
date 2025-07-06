import 'package:flutter/material.dart';
import 'package:loja/Databasehelper.dart';
import 'package:loja/cadastro.dart';
import 'package:loja/inicio.dart';
import 'package:flutter/services.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _nomeController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _visivel = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Login",
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
                labelText: "Usuario",
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
                  icon: Icon(
                      _visivel ? Icons.visibility : Icons.visibility_off),
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

            ElevatedButton(
              onPressed: () async {
                String nome = _nomeController.text.trim();
                String senha = _senhaController.text.trim();

                if (nome.isEmpty || senha.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Por favor, preencha todos os campos")),
                  );
                  return;
                }

                bool sucesso = await DatabaseHelper().login(nome, senha);

                if (sucesso) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Inicio()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Erro de login"),
                      content: Text("Usuário ou senha incorretos."),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text("Entrar"),
            ),

            SizedBox(height: 20),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaCadastro()), 
                );
              },
              child: const Text(
                "Criar uma conta",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

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
