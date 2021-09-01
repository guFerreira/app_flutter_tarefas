import 'package:app_flutter_tarefas/app/database/dao/interfaces/disciplina_dao.dart';
import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';
import 'package:get_it/get_it.dart';

class DisciplinaService {
  var _dao = GetIt.I.get<DisciplinaDAO>();

  Future<Disciplina> getDisciplinaPorId(int id) {
    return _dao.buscarPorId(id);
  }

  Future<List<Disciplina>> getDisciplinas() {
    return _dao.buscarTodos();
  }

  remover(Disciplina disciplina) {
    _dao.remover(disciplina);
  }

  salvar(Disciplina disciplina) {
    _dao.salvar(disciplina);
  }

  atualizar(Disciplina disciplina) {
    _dao.atualizar(disciplina);
  }
}
