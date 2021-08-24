import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';

class Tarefa {
  late String _descricao;
  late DateTime _dataEntrega;
  late Disciplina _disciplina;
  late bool _isConcluida;

  Tarefa(
      this._descricao, this._dataEntrega, this._disciplina, this._isConcluida);

  String getDescricao() {
    return this._descricao;
  }

  void setDescricao(value) {
    this._descricao = value;
  }

  DateTime getDataEntrega() {
    return this._dataEntrega;
  }

  void setDataEntrega(value) {
    this._dataEntrega = value;
  }

  Disciplina getDisciplina() {
    return this._disciplina;
  }

  void setDisciplina(value) {
    this._disciplina = value;
  }

  bool getIsConcluida() {
    return this._isConcluida;
  }

  void setIsConcluida(value) {
    this._isConcluida = value;
  }
}
