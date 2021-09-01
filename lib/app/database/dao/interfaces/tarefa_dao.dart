import 'package:app_flutter_tarefas/app/models/tarefa_model.dart';

abstract class TarefaDAO {
  Future<List<Tarefa>> buscarTodas();

  Future<List<Tarefa>> buscarTarefasPendentes();

  salvar(Tarefa tarefa);

  remover(Tarefa tarefa);

  Future<Tarefa> buscarPorId(int id);

  atualizar(Tarefa tarefa);

  Future<List<Tarefa>> buscarConcluidas();

  concluirTarefa(Tarefa tarefa);
}
