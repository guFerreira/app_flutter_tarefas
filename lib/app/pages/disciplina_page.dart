import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisciplinaPage extends StatefulWidget {
  DisciplinaPage({Key? key}) : super(key: key);

  @override
  _DisciplinaPageState createState() => _DisciplinaPageState();
}

class _DisciplinaPageState extends State<DisciplinaPage> {
  late List<Disciplina> disciplinas = [
    Disciplina('RP 2', 'Disciplina para aprender sobre testes de software'),
    Disciplina('POO',
        'Disciplina para aprender sobre o paradigma de programação orientado a objetos.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disciplinas'),
        backgroundColor: Colors.deepPurple[700],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('Adicionar'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple[700],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 10,
                ),
                child: Center(
                  child: Container(
                    width: 300,
                    child: Text(
                      'Você possui ${disciplinas.length} Disciplinas cadastradas',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: disciplinas.length,
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
                              padding: const EdgeInsets.only(top: 20, left: 20),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  disciplinas[index].nome,
                                  style: TextStyle(
                                    color: Colors.deepPurple[700],
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 12,
                                left: 10,
                                right: 10,
                                bottom: 20,
                              ),
                              child: Wrap(
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        disciplinas[index].descricao,
                                        style: TextStyle(
                                          color: Colors.deepPurple[600],
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 6, right: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Ink(
                                    decoration: const ShapeDecoration(
                                      color: Colors.deepPurple,
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.edit),
                                      color: Colors.white,
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Ink(
                                    decoration: const ShapeDecoration(
                                      color: Colors.deepPurple,
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.delete),
                                      color: Colors.white,
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
    );
  }
}
