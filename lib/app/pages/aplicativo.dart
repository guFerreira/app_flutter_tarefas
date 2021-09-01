import 'package:app_flutter_tarefas/app/pages/disciplina/disciplina_page.dart';
import 'package:app_flutter_tarefas/app/pages/disciplina/form_disciplina_page.dart';
import 'package:app_flutter_tarefas/app/pages/home_page.dart';
import 'package:app_flutter_tarefas/app/pages/login_page.dart';
import 'package:app_flutter_tarefas/app/pages/tarefa/form_tarefa_page.dart';
import 'package:app_flutter_tarefas/app/pages/tarefa/tarefa_page.dart';
import 'package:app_flutter_tarefas/app/pages/tarefa/tarefas_concluidas_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Aplicativo extends StatelessWidget {
  const Aplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      themeMode: ThemeMode.dark,
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/disciplina': (context) => DisciplinaPage(),
        '/formDisciplina': (context) => FormDisciplinaPage(),
        '/tarefa': (context) => TarefaPage(),
        '/tarefaConcluida': (context) => TarefaConcluidaPage(),
        '/formTarefa': (context) => FormTarefaPage(),
      },
    );
  }
}
