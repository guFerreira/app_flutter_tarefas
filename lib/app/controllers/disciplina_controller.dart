import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';
import 'package:app_flutter_tarefas/app/service/disciplina_service.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class DisciplinaController extends GetxController {
  var _disciplinaService = GetIt.I<DisciplinaService>();

  RxList<Disciplina> disciplinas = <Disciplina>[].obs;

  @override
  void onInit() {
    super.onInit();
    buscarDisciplinas();
  }

  buscarDisciplinas() async {
    var lista = await _disciplinaService.getDisciplinas();
    disciplinas.value = lista;
    disciplinas.refresh();
  }

  excluirDisciplina(Disciplina disciplina) {
    _disciplinaService.remover(disciplina);
    buscarDisciplinas();
  }

  atualizarDisciplina(Disciplina disciplina) {
    _disciplinaService.atualizar(disciplina);
    buscarDisciplinas();
  }

  adicionarDisciplina(Disciplina disciplina) {
    _disciplinaService.salvar(disciplina);
    buscarDisciplinas();
  }
}
