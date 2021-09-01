import 'package:app_flutter_tarefas/app/database/dao/impl/disciplina_dao_impl.dart';
import 'package:app_flutter_tarefas/app/database/dao/impl/tarefa_dao_impl.dart';
import 'package:app_flutter_tarefas/app/database/dao/interfaces/disciplina_dao.dart';
import 'package:app_flutter_tarefas/app/database/dao/interfaces/tarefa_dao.dart';
import 'package:app_flutter_tarefas/app/service/disciplina_service.dart';
import 'package:app_flutter_tarefas/app/service/tarefa_service.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<TarefaDAO>(TarefaDAOImpl());
  getIt.registerSingleton<TarefaService>(TarefaService());

  getIt.registerSingleton<DisciplinaDAO>(DisciplinaDAOImpl());
  getIt.registerSingleton<DisciplinaService>(DisciplinaService());
}
