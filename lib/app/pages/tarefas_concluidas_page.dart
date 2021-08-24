import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';
import 'package:app_flutter_tarefas/app/models/tarefa_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TarefaConcluidaPage extends StatelessWidget {
  TarefaConcluidaPage({Key? key}) : super(key: key);

  List<Tarefa> tarefas = [
    Tarefa(
      'Fazer diagrama de classes',
      DateTime.now(),
      Disciplina('POO', 'relens'),
      false,
    ),
    Tarefa(
      'Entrega 2 - Criar casos de teste',
      DateTime.now(),
      Disciplina('RP 2', 'testes'),
      false,
    ),
  ];

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
                ListView.builder(
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
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 20),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    tarefas[index].getDescricao(),
                                    style: TextStyle(
                                      color: Colors.deepPurple[700],
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 20),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Disciplina: ' +
                                        tarefas[index].getDisciplina().nome,
                                    style: TextStyle(
                                      color: Colors.deepPurple[900],
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 20),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Entrega: ' +
                                        tarefas[index]
                                            .getDataEntrega()
                                            .toString(),
                                    style: TextStyle(
                                      color: Colors.deepPurple[900],
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 20),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Icon(Icons.check,color: Colors.green,size: 30,),
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
                              ),
                              getButtonsCardTarefa(),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
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

  getButtonsCardTarefa() {
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
          createButtonCardTarefa(Icons.delete, () {}),
        ],
      ),
    );
  }

  createButtonCardTarefa(IconData icon, void Function() onPressed) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Colors.deepPurple,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: Icon(icon),
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}
