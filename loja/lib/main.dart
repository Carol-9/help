import 'package:flutter/material.dart';
import 'package:loja/telaInicial.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR','http://localhost:57275/');
  runApp(loja1());
   
}

class loja1 extends StatelessWidget {
  const loja1({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HP Materiais Elétricos",
      debugShowCheckedModeBanner: false,
      //todos os botoes tem essa conf
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 14, 47, 157),
            foregroundColor: Colors.black, // Cor do texto
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Canto arredondados
            ),
            elevation: 5, // Sombra do botão
          ),
        ),
      ),
      home: TelaInicial(),
    );
  }
}
