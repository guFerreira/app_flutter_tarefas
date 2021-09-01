import 'package:app_flutter_tarefas/app/controllers/tarefa_controller.dart';
import 'package:app_flutter_tarefas/app/models/tarefa_model.dart';
import 'package:app_flutter_tarefas/app/pages/components/botao_circular.dart';
import 'package:app_flutter_tarefas/app/pages/components/texts_info_tarefas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TarefaConcluidaPage extends StatelessWidget {
  final tarefaController = Get.put(TarefaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas concluidas'),
        backgroundColor: Colors.deepPurple[700],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                _getListViewBuilder(),
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

  _getListViewBuilder() {
    return GetX<TarefaController>(
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.tarefasConcluidas.length,
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
                        tarefa: controller.tarefasConcluidas[index],
                      ),
                      _getTextConcluida(),
                      _getButtonsCardTarefa(
                        controller.tarefasConcluidas[index],
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

  _getTextConcluida() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Icon(
              Icons.check,
              color: Colors.green,
              size: 30,
            ),
            Text(
              'Concluída',
              style: TextStyle(
                color: Colors.deepPurple[900],
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getButtonsCardTarefa(Tarefa tarefa) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 6,
        right: 8,
        top: 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
}
