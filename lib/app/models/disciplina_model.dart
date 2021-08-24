class Disciplina {
  late String _nome;
  late String _descricao;

  Disciplina(this._nome, this._descricao);

  get nome => this._nome;

  set nome(value) => this._nome = value;

  get descricao => this._descricao;

  set descricao(value) => this._descricao = value;
}
