import 'package:app_flutter_tarefas/app/controllers/disciplina_controller.dart';
import 'package:app_flutter_tarefas/app/pages/disciplina_page.dart';
import 'package:app_flutter_tarefas/app/pages/form_disciplina_page.dart';
import 'package:app_flutter_tarefas/app/pages/form_tarefa_page.dart';
import 'package:app_flutter_tarefas/app/pages/home_page.dart';
import 'package:app_flutter_tarefas/app/pages/login_page.dart';
import 'package:app_flutter_tarefas/app/pages/tarefa_page.dart';
import 'package:app_flutter_tarefas/app/pages/tarefas_concluidas_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Aplicativo extends StatelessWidget {
  const Aplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DisciplinaController>.value(
          value: DisciplinaController(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
