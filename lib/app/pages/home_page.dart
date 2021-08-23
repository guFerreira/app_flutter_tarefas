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
                Container(
                  width: 300,
                  height: 200,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.purple[100],
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Gerencie suas Tarefas',
                            style: TextStyle(
                              color: Colors.deepPurple[700],
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
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
                          child: Text(
                            'Visualize, crie, atualize, exclua e veja as suas tarefas concluídas.',
                            style: TextStyle(
                              color: Colors.deepPurple[600],
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 180,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Ir para Tarefas',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple[700],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 200,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.purple[100],
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Gerencie suas Disciplinas',
                            style: TextStyle(
                              color: Colors.deepPurple[700],
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
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
                          child: Text(
                            'Visualize, crie, atualize, exclua novas disciplinas no sistema.',
                            style: TextStyle(
                              color: Colors.deepPurple[600],
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Ir para Disciplinas',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple[700],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 120,
                  height: 180,
                  child: Image.asset("assets/images/unipampa.jpg"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
