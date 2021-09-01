import 'package:app_flutter_tarefas/app/database/dao/interfaces/tarefa_dao.dart';
import 'package:app_flutter_tarefas/app/models/tarefa_model.dart';
import 'package:get_it/get_it.dart';

class TarefaService {
  var _dao = GetIt.I.get<TarefaDAO>();

  Future<List<Tarefa>> getTarefasConcluidas() {
    return _dao.buscarConcluidas();
  }

  Future<List<Tarefa>> getTarefasPendentes() {
    return _dao.buscarTarefasPendentes();
  }

  Future<Tarefa> getTarefaPorId(int id) {
    return _dao.buscarPorId(id);
  }

  Future<List<Tarefa>> getTarefas() async {
    var tarefas = await _dao.buscarTodas();
    return tarefas;
  }

  atualizarTarefa(Tarefa tarefa) {
    _dao.atualizar(tarefa);
  }

  removerTarefa(Tarefa tarefa) {
    _dao.remover(tarefa);
  }

  salvarTarefa(Tarefa tarefa) {
    _dao.salvar(tarefa);
  }

  concluirTarefa(Tarefa tarefa) {
    _dao.concluirTarefa(tarefa);
  }
}
