import 'package:app_flutter_tarefas/app/components/disciplina_tile.dart';
import 'package:app_flutter_tarefas/app/controllers/disciplina_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisciplinaPage extends StatefulWidget {
  DisciplinaPage({Key? key}) : super(key: key);
  
  @override
  _DisciplinaPageState createState() => _DisciplinaPageState();
}

class _DisciplinaPageState extends State<DisciplinaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disciplinas'),
        backgroundColor: Colors.deepPurple[700],
      ),
      floatingActionButton: _getFloatButton(context),
      body: Consumer<DisciplinaController>(
        builder: (context, disciplinaController, widget) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  _getContadorDisciplinas(),
                  _getListViewDisciplinas(),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _getContadorDisciplinas() {
    DisciplinaController dc = Provider.of<DisciplinaController>(context);

    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 10,
      ),
      child: Center(
        child: Container(
          width: 300,
          child: Text(
            'Você possui ${dc.getDisciplinasLenght()} Disciplinas cadastradas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  _getListViewDisciplinas() {
    DisciplinaController dc = Provider.of<DisciplinaController>(context);

    return ListView.builder(
      itemCount: dc.disciplinas.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return DisciplinaTile(
          disciplina: dc.getDisciplinaByIndex(index),
          index: index,
        );
      },
    );
  }

  _getFloatButton(context) {
    return FloatingActionButton.extended(
      onPressed: () {
        _irParaAdicionarDisciplina(context);
      },
      label: const Text('Adicionar'),
      icon: const Icon(Icons.add),
      backgroundColor: Colors.deepPurple[700],
    );
  }

  _irParaAdicionarDisciplina(context) {
    Navigator.pushNamed(context, '/formDisciplina');
  }
}
