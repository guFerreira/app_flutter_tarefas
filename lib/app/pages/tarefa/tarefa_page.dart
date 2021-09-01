import 'package:app_flutter_tarefas/app/controllers/tarefa_controller.dart';
import 'package:app_flutter_tarefas/app/models/tarefa_model.dart';
import 'package:app_flutter_tarefas/app/pages/components/botao_circular.dart';
import 'package:app_flutter_tarefas/app/pages/components/texts_info_tarefas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TarefaPage extends StatelessWidget {
  final tarefaController = Get.put(TarefaController());

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
    return GetX<TarefaController>(
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.tarefasPendentes.length,
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
                        tarefa: controller.tarefasPendentes[index],
                      ),
                      _getButtonsCardTarefa(
                        controller.tarefasPendentes[index],
                        context,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
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

  _getButtonsCardTarefa(Tarefa tarefa, context) {
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
              tarefaController.concluirTarefa(tarefa);
            },
          ),
          SizedBox(width: 10),
          BotaoCircular(
            icon: Icons.edit,
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/formTarefa',
                arguments: {
                  'tarefa': tarefa,
                },
              );
            },
          ),
          SizedBox(width: 10),
          BotaoCircular(
            icon: Icons.delete,
            onPressed: () {
              tarefaController.excluirTarefas(tarefa);
            },
          ),
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
