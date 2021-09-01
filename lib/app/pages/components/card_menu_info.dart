import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardMenuInfo extends StatelessWidget {
  String titulo;
  String conteudo;
  String textoBotao;
  String route;

  CardMenuInfo({
    Key? key,
    required this.titulo,
    required this.conteudo,
    required this.textoBotao,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.purple[100],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                titulo,
                style: TextStyle(
                  color: Colors.deepPurple[700],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                left: 10,
                right: 10,
                bottom: 20,
              ),
              child: Text(
                conteudo,
                style: TextStyle(
                  color: Colors.deepPurple[600],
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, route);
                },
                child: Text(
                  textoBotao,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
