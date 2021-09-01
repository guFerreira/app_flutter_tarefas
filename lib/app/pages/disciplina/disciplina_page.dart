import 'package:app_flutter_tarefas/app/controllers/disciplina_controller.dart';
import 'package:app_flutter_tarefas/app/pages/components/disciplina_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisciplinaPage extends StatelessWidget {
  final disciplinaController = Get.put(DisciplinaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disciplinas'),
        backgroundColor: Colors.deepPurple[700],
      ),
      floatingActionButton: _getFloatButton(context),
      body: SingleChildScrollView(
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
      ),
    );
  }

  _getContadorDisciplinas() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 10,
      ),
      child: Center(
        child: Container(
          width: 300,
          child: GetX<DisciplinaController>(
            builder: (controller) {
              return Text(
                'Você possui ${controller.disciplinas.length} Disciplinas cadastradas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              );
            },
          ),
        ),
      ),
    );
  }

  _getListViewDisciplinas() {
    return GetX<DisciplinaController>(
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.disciplinas.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return DisciplinaTile(
              disciplina: controller.disciplinas[index],
              index: index,
            );
          },
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
