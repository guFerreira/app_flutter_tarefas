import 'package:app_flutter_tarefas/app/pages/disciplina_page.dart';
import 'package:app_flutter_tarefas/app/pages/home_page.dart';
import 'package:app_flutter_tarefas/app/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Aplicativo extends StatelessWidget {
  const Aplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/disciplina',
      routes: {
        '/': (context) =>LoginPage(),
        '/home': (context) => HomePage(),
        '/disciplina': (context) => DisciplinaPage(),
      },
    );
  }
}
