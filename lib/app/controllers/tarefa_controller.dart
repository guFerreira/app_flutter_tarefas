import 'package:app_flutter_tarefas/app/models/tarefa_model.dart';
import 'package:app_flutter_tarefas/app/service/tarefa_service.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class TarefaController extends GetxController {
  var _tarefaService = GetIt.I.get<TarefaService>();

  //lista de tarefas
  RxList<Tarefa> tarefasPendentes = <Tarefa>[].obs;
  RxList<Tarefa> tarefasConcluidas = <Tarefa>[].obs;

  @override
  void onInit() {
    super.onInit();
    buscarTarefasPendentes();
    buscarTarefasConcluidas();
  }

  buscarTarefasPendentes() async {
    var lista = await _tarefaService.getTarefasPendentes();
    tarefasPendentes.value = lista;
    tarefasPendentes.refresh();
  }

  buscarTarefasConcluidas() async {
    var lista = await _tarefaService.getTarefasConcluidas();
    tarefasConcluidas.value = lista;
    tarefasConcluidas.refresh();
  }

  excluirTarefas(Tarefa tarefa) {
    _tarefaService.removerTarefa(tarefa);
    buscarTarefasPendentes();
    buscarTarefasConcluidas();
    tarefasConcluidas.refresh();
    tarefasPendentes.refresh();
  }

  atualizarTarefas(Tarefa tarefa) {
    _tarefaService.atualizarTarefa(tarefa);
    buscarTarefasPendentes();
    buscarTarefasConcluidas();
  }

  adicionarTarefas(Tarefa tarefa) {
    _tarefaService.salvarTarefa(tarefa);
    buscarTarefasPendentes();
    buscarTarefasConcluidas();
  }

  concluirTarefa(Tarefa tarefa) {
    _tarefaService.concluirTarefa(tarefa);
    buscarTarefasPendentes();
    buscarTarefasConcluidas();
  }
}
