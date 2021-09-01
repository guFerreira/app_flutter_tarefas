import 'package:app_flutter_tarefas/app/pages/components/card_menu_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu_book,
        ),
        title: Text('Início'),
        backgroundColor: Colors.deepPurple[700],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CardMenuInfo(
                  titulo: 'Gerencie suas Tarefas',
                  conteudo:
                      'Visualize, crie, atualize, exclua e veja as suas tarefas concluídas.',
                  textoBotao: 'Ir para Tarefas',
                  route: '/tarefa',
                ),
                SizedBox(
                  height: 20,
                ),
                CardMenuInfo(
                  titulo: 'Gerencie suas Disciplinas',
                  conteudo:
                      'Visualize, crie, atualize, exclua novas disciplinas no sistema.',
                  textoBotao: 'Ir para Disciplinas',
                  route: '/disciplina',
                ),
                getLogoUnipampa(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getLogoUnipampa() {
    return SizedBox(
      width: 120,
      height: 180,
      child: Image.asset("assets/images/unipampa.jpg"),
    );
  }
}
