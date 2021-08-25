import 'package:app_flutter_tarefas/app/components/botao_circular.dart';
import 'package:app_flutter_tarefas/app/controllers/disciplina_controller.dart';
import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisciplinaTile extends StatefulWidget {
  late Disciplina? disciplina;
  late int? index;
  DisciplinaTile({Key? key, this.disciplina, this.index}) : super(key: key);

  @override
  _DisciplinaTileState createState() => _DisciplinaTileState();
}

class _DisciplinaTileState extends State<DisciplinaTile> {
  @override
  Widget build(BuildContext context) {
    DisciplinaController dc =
        Provider.of<DisciplinaController>(context, listen: true);
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
                    widget.disciplina!.nome,
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
                          widget.disciplina!.descricao,
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
                    BotaoCircular(
                      icon: Icons.edit,
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/formDisciplina',
                          arguments: {
                            'disciplina': widget.disciplina,
                            'index': widget.index
                          },
                        );
                      },
                    ),
                    SizedBox(width: 10),
                    BotaoCircular(
                      icon: Icons.delete,
                      onPressed: () {
                        setState(() {
                          dc.excluirDisciplina(widget.index!);
                          dc.notifyListeners();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
