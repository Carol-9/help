import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Estoque extends StatefulWidget {
  @override
  _EstoqueState createState() => _EstoqueState();
}

class _EstoqueState extends State<Estoque> {
  List produtos = [];
  List filtro = []; 
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    buscarProdutos();
  }

  Future<void> buscarProdutos() async {
    final url = Uri.parse('https://fakestoreapi.com/products/category/electronics');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List dados = json.decode(response.body);
      setState(() {
        produtos = dados;
        filtro = dados; 
        carregando = false;
      });
    } else {
      print('Erro: ${response.statusCode}');
      setState(() => carregando = false);
    }
  }

  void filtrarProdutos(String busca) {
    final resultado = produtos.where((produto) {
      final nome = produto['title'].toString().toLowerCase();
      return nome.contains(busca.toLowerCase());
    }).toList();

    setState(() {
      filtro = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estoque'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: carregando
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar produto...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onChanged: filtrarProdutos,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filtro.length,
                    itemBuilder: (context, i) {
                      final p = filtro[i];
                      return ListTile(
                        title: Text(p['title']),
                        subtitle: Text("R\$ ${p['price']}"),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
