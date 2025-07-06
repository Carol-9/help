import 'package:flutter/material.dart';
import 'package:loja/estoque.dart';
import 'package:loja/pagamentos.dart';
import 'package:intl/intl.dart';



class Inicio extends StatefulWidget {

  @override
  InicioState createState() => InicioState();
}

class InicioState extends State<Inicio> {
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, List<String>> _events = {};

  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  List<DateTime> _getWeekDays(DateTime focusedDay) {
    final startOfWeek = focusedDay.subtract(
      Duration(days: focusedDay.weekday - 1),
    );
    return List.generate(
      7,
      (i) => _normalizeDate(startOfWeek.add(Duration(days: i))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final weekDays = _getWeekDays(_focusedDay);

    return Scaffold(
       appBar: AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    title: Text(
      "Agenda clientes",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 255, 245, 245),
        letterSpacing: 1.5,
      ),
    ),
    centerTitle: true,
    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
  ),
  drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.black),
          child: Text(
            "Bem-vindo!",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text("Estoque"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Estoque()),
            );
          },
        ),
        // ListTile(
        //   leading: Icon(Icons.payment),
        //   title: Text("Pagamentos"),
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => Pagamentos()),
        //     );
        //   },
        // ),
      ],
    ),
  ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: weekDays.length,
          itemBuilder: (context, index) {
            final day = weekDays[index];
            final events = _events[day] ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  tileColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  title: Text(
                    DateFormat.EEEE('pt_BR').format(day),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  trailing: Icon(Icons.add, color: Colors.blueAccent),
                  onTap: () {
                    String novoEvento = '';
                    showDialog(
                      context: context,
                      builder:
                          (_) => AlertDialog(
                            title: Text("Adicionar evento"),
                            content: TextField(
                              onChanged: (value) => novoEvento = value,
                              decoration: InputDecoration(
                                hintText: "Ex: Comprar produto",
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Cancelar"),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    final dateKey = _normalizeDate(day);
                                    if (_events[dateKey] != null) {
                                      _events[dateKey]!.add(novoEvento);
                                    } else {
                                      _events[dateKey] = [novoEvento];
                                    }
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text("Salvar"),
                              ),
                            ],
                          ),
                    );
                  },
                ),
                ...events.asMap().entries.map((entry) {
                  final event = entry.value;
                  final idx = entry.key;
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.event_note, color: Colors.blueAccent),
                      title: Text(event),
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder:
                              (_) => AlertDialog(
                                title: Text('Excluir evento'),
                                content: Text('Deseja excluir "$event"?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _events[day]!.removeAt(idx);
                                        if (_events[day]!.isEmpty) {
                                          _events.remove(day);
                                        }
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Excluir',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                        );
                      },
                    ),
                  );
                }).toList(),
                SizedBox(height: 12),
              ],
            );
          },
        ),
      ),
    );
  }
}
