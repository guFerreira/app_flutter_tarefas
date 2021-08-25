
class Tarefa {
  late String _descricao;
  late DateTime _dataEntrega;
  late bool _isConcluida;

  Tarefa(
      this._descricao, this._dataEntrega,this._isConcluida);

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

  bool getIsConcluida() {
    return this._isConcluida;
  }

  void setIsConcluida(value) {
    this._isConcluida = value;
  }
}
