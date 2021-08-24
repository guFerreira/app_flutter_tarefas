import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormDisciplina extends StatelessWidget {
  const FormDisciplina({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário Disciplina'),
        backgroundColor: Colors.deepPurple[700],
      ),
      body: Center(
        child: Container(
          width: 380,
          height: 400,
          child: Card(
            color: Colors.deepPurple[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 30,
                right: 30,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nome',
                      style: TextStyle(
                          color: Colors.deepPurple[700], fontSize: 26),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Digite o nome da disciplina',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: 3.0,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.purple,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Descrição',
                      style: TextStyle(
                          color: Colors.deepPurple[700], fontSize: 26),
                    ),
                  ),
                  TextField(
                    minLines: 2,
                    maxLines: 5,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Digite a descrição da disciplina',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: 3.0,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.purple,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 200,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Criar',
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
