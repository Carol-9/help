import 'package:flutter/material.dart';

class BotaoPadrao extends StatelessWidget {
  final String texto;
  final Widget destino;

  const BotaoPadrao({
    Key? key,
    required this.texto,
    required this.destino,
  }) : super(key: key);

  void _navegarComAnimacao(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destino,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end)
              .chain(CurveTween(curve: Curves.ease));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: Duration(milliseconds: 760),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _navegarComAnimacao(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 14, 47, 157),
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      child: Text(texto),
    );
  }
}
