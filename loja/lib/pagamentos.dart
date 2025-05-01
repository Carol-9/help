import 'package:flutter/material.dart';
import 'package:loja/inicio.dart';

class Pagamentos extends StatefulWidget {
  @override
  pagamentosState createState() => pagamentosState();
}

class pagamentosState extends State<Pagamentos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("paga otario!",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 255, 245, 245),
          letterSpacing: 1.5,
        ),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(

      ),
    );
  }
}
