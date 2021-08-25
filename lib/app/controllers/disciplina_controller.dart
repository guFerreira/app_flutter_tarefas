import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';
import 'package:app_flutter_tarefas/app/models/tarefa_model.dart';
import 'package:app_flutter_tarefas/app/repositories/disciplina_repository.dart';
import 'package:flutter/cupertino.dart';

class DisciplinaController extends ChangeNotifier {
  List<Disciplina> disciplinas = DisciplinaRespository().getDisciplinas();

  Disciplina getDisciplinaByIndex(int index) {
    return disciplinas.elementAt(index);
  }

  int getDisciplinasLenght() {
    return disciplinas.length;
  }

  void adicionarDisciplina(String nome, String descricao) {
    Disciplina d = Disciplina(nome, descricao, []);
    this.disciplinas.add(d);
  }

  void atualizarDisciplina(int index, String nome, String descricao) {
    this.disciplinas.elementAt(index).nome = nome;
    this.disciplinas.elementAt(index).descricao = descricao;
  }

  void excluirDisciplina(int index) {
    this.disciplinas.removeAt(index);
  }

  getDisciplinabyTarefa(Tarefa tarefa) {
    List<Disciplina> disciplinas = this.disciplinas;

    for (int i = 0; i < disciplinas.length; i++) {
      for (int j = 0; j < disciplinas[i].tarefas.length; j++) {
        if (tarefa == disciplinas[i].tarefas[j]) {
          return disciplinas[i];
        }
      }
    }
  }

  List<Tarefa> getTarefasConcluidas() {
    List<Disciplina> disciplinas = this.disciplinas;
    List<Tarefa> tarefas = [];

    for (int i = 0; i < disciplinas.length; i++) {
      for (int j = 0; j < disciplinas[i].tarefas.length; j++) {
        if (disciplinas[i].tarefas[j].getIsConcluida() == true) {
          tarefas.add(disciplinas[i].tarefas[j]);
        }
      }
    }
    return tarefas;
  }

  concluirTarefa(Tarefa tarefa) {
    List<Disciplina> disciplinas = this.disciplinas;
    List<Tarefa> tarefas = [];

    for (int i = 0; i < disciplinas.length; i++) {
      for (int j = 0; j < disciplinas[i].tarefas.length; j++) {
        if (disciplinas[i].tarefas[j] == tarefa) {
          disciplinas[i].tarefas[j].setIsConcluida(true);
        }
      }
    }
  }

  excluirTarefa(Tarefa tarefa) {
    List<Disciplina> disciplinas = this.disciplinas;
    for (int i = 0; i < disciplinas.length; i++) {
      for (int j = 0; j < disciplinas[i].tarefas.length; j++) {
        if (disciplinas[i].tarefas[j] == tarefa) {
          disciplinas[i].tarefas.remove(tarefa);
        }
      }
    }
  }

  adicionarTarefa(Tarefa tarefa){
    disciplinas.first.tarefas.add(tarefa);
  }

  atualizarTarefa(Tarefa tarefa, int idTarefa, int idDisciplina){
    this.disciplinas[idDisciplina].tarefas[idTarefa] = tarefa;
  }

  getIdDisciplinabyTarefa(Tarefa tarefa) {
    List<Disciplina> disciplinas = this.disciplinas;

    for (int i = 0; i < disciplinas.length; i++) {
      for (int j = 0; j < disciplinas[i].tarefas.length; j++) {
        if (tarefa == disciplinas[i].tarefas[j]) {
          return i;
        }
      }
    }
  }
}
