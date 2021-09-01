import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';

abstract class DisciplinaDAO {
  Future<List<Disciplina>> buscarTodos();

  salvar(Disciplina disciplina);

  remover(Disciplina disciplina);

  Future<Disciplina> buscarPorId(int id);

  atualizar(Disciplina disciplina);
}
