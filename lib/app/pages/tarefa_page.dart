import 'package:app_flutter_tarefas/app/components/botao_circular.dart';
import 'package:app_flutter_tarefas/app/components/texts_info_tarefas.dart';
import 'package:app_flutter_tarefas/app/controllers/disciplina_controller.dart';
import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';
import 'package:app_flutter_tarefas/app/models/tarefa_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TarefaPage extends StatefulWidget {
  TarefaPage({Key? key}) : super(key: key);

  @override
  _TarefaPageState createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas'),
        backgroundColor: Colors.deepPurple[700],
      ),
      floatingActionButton: _getFloatingButtons(context),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                getListViewTarefas(),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getListViewTarefas() {
    DisciplinaController dc = Provider.of<DisciplinaController>(context);
    List<Disciplina> disciplinas = dc.disciplinas;
    List<Tarefa> tarefas = [];
    int idDisciplina = 0;
    for (int i = 0; i < disciplinas.length; i++) {
      for (int j = 0; j < disciplinas[i].tarefas.length; j++) {
        if (disciplinas[i].tarefas[j].getIsConcluida() == false) {
          tarefas.add(disciplinas[i].tarefas[j]);
          idDisciplina = i;
        }
      }
    }

    return ListView.builder(
      itemCount: tarefas.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
            top: 10,
            bottom: 10,
          ),
          child: Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.purple[100],
              child: Column(
                children: [
                  TextInfoTarefa(
                    tarefa: tarefas[index],
                  ),
                  _getButtonsCardTarefa(tarefas[index], index, idDisciplina),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _getFloatingButtons(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _criarFloatingActionButton(
          'Concluídas',
          Icons.check,
          () {
            _irParaTarefasConcluidas(context);
          },
          true,
        ),
        SizedBox(
          width: 6,
        ),
        _criarFloatingActionButton(
          'Adicionar',
          Icons.add,
          () {
            _irParaAdicionarTarefa(context);
          },
          false,
        ),
      ],
    );
  }

  _criarFloatingActionButton(
      String nome, IconData icon, void Function() onPressed, bool heroTag) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: Text('$nome'),
      icon: Icon(icon),
      backgroundColor: Colors.deepPurple[700],
      heroTag: heroTag,
    );
  }

  _getButtonsCardTarefa(Tarefa tarefa, int idTarefa, int idDisciplina) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 6,
        right: 8,
        top: 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BotaoCircular(
              icon: Icons.check,
              onPressed: () {
                setState(() {
                  DisciplinaController dc =
                      Provider.of<DisciplinaController>(context, listen: false);
                  dc.concluirTarefa(tarefa);
                  dc.notifyListeners();
                });
              }),
          SizedBox(width: 10),
          BotaoCircular(
              icon: Icons.edit,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/formTarefa',
                  arguments: {
                    'tarefa': tarefa,
                    'idTarefa': idTarefa,
                    'idDisciplina': idDisciplina,
                  },
                );
              }),
          SizedBox(width: 10),
          BotaoCircular(
              icon: Icons.delete,
              onPressed: () {
                setState(() {
                  DisciplinaController dc =
                      Provider.of<DisciplinaController>(context, listen: false);
                  dc.excluirTarefa(tarefa);
                  dc.notifyListeners();
                });
              }),
        ],
      ),
    );
  }

  _irParaTarefasConcluidas(context) {
    Navigator.pushNamed(context, '/tarefaConcluida');
  }

  _irParaAdicionarTarefa(context) {
    Navigator.pushNamed(context, '/formTarefa');
  }
}
