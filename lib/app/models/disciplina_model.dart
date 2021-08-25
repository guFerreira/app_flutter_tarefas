import 'package:app_flutter_tarefas/app/models/tarefa_model.dart';

class Disciplina {
  late String _nome;
  late String _descricao;
  late List<Tarefa> _tarefas;

  Disciplina(this._nome, this._descricao, this._tarefas);

  get nome => this._nome;

  set nome(value) => this._nome = value;

  get descricao => this._descricao;

  set descricao(value) => this._descricao = value;

  get tarefas => this._tarefas;

  set tarefas(value) => this._tarefas = value;
}
