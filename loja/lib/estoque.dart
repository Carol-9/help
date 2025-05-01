import 'package:flutter/material.dart';


class Estoque extends StatefulWidget {
  @override
  _EstoqueState createState() => _EstoqueState();
}

class _EstoqueState extends State<Estoque> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("bacon",style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 255, 245, 245),
          letterSpacing: 1.5,
        ),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
    );
  }}



