import 'package:app_flutter_tarefas/app/models/tarefa_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInfoTarefa extends StatefulWidget {
  late Tarefa tarefa;
  TextInfoTarefa({Key? key, required this.tarefa}) : super(key: key);

  @override
  _TextInfoTarefaState createState() => _TextInfoTarefaState();
}

class _TextInfoTarefaState extends State<TextInfoTarefa> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getTextDescricaoTarefa(
          widget.tarefa.descricao,
        ),
        _getTextDisciplina(widget.tarefa),
        _getTextDataDeEntrega(widget.tarefa.dataEntrega),
      ],
    );
  }

  _getTextDescricaoTarefa(String descricao) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          descricao,
          style: TextStyle(
            color: Colors.deepPurple[700],
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _getTextDisciplina(Tarefa tarefa) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Disciplina: ' + tarefa.disciplina.nome,
          style: TextStyle(
            color: Colors.deepPurple[900],
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  _getTextDataDeEntrega(DateTime data) {
    String dataEntrega = data.day.toString() +
        '/' +
        data.month.toString() +
        '/' +
        data.year.toString();
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Entrega: ' + dataEntrega,
          style: TextStyle(
            color: Colors.deepPurple[900],
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
