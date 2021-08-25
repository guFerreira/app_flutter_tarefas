

import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';
import 'package:app_flutter_tarefas/app/models/tarefa_model.dart';

class DisciplinaRespository{
  final List<Disciplina> _disciplinas = [
    Disciplina('RP 2', 'Disciplina de RP2 descrição',[
      Tarefa('Entrega 1 - analisar requisitos', DateTime(2021,08,28), true),
      Tarefa('Entrega 2 - criar casos de teste', DateTime(2021,09,04), false),
    ]),
    Disciplina('POO', 'Disciplina de POO descrição',[
      Tarefa('Criar diagrama de classes', DateTime(2021,09,10), false),
      
    ]),
  ];

  getDisciplinas(){
    return _disciplinas;
  }
}