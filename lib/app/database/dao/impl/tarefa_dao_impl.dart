import 'package:app_flutter_tarefas/app/database/connection/db_connection.dart';
import 'package:app_flutter_tarefas/app/database/dao/interfaces/tarefa_dao.dart';
import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';
import 'package:app_flutter_tarefas/app/models/tarefa_model.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqlite_api.dart';

class TarefaDAOImpl implements TarefaDAO {
  Database? _db;

  @override
  Future<List<Tarefa>> buscarTarefasPendentes() async {
    _db = await Connection.get();
    int isConcluida = 0; //false
    List<Map<String, dynamic>> resultado = await _db!
        .query('Tarefa', where: 'isConcluida = ?', whereArgs: [isConcluida]);

    //lista dos ids da disciplina
    List<int> listaIdsDisciplinas = List.generate(resultado.length, (i) {
      var linha = resultado[i];

      return linha['idDisciplina'];
    });
    //lista das tarefas sem a disciplina
    List<Tarefa> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      print(i);
      print(linha['id']);
      print('teste');
      print(linha['dataEntrega']);
      print('isconcluida');
      print(linha['isConcluida']);
      String data = linha['dataEntrega'];
      DateFormat dataFormat = DateFormat('yyyy-MM-dd hh:mm:ss');
      return Tarefa(
          id: linha['id'],
          dataEntrega: dataFormat.parse(data),
          descricao: linha['descricao'],
          disciplina: Disciplina(
            id: -1,
            nome: '',
            descricao: '',
          ),
          isConcluida: _getBoolDB(linha['isConcluida']));
    });
    //adicionar disciplinas nas tarefas
    for (int i = 0; i < listaIdsDisciplinas.length; i++) {
      var disciplina = await _buscarDisciplinaIdDb(listaIdsDisciplinas[i]);
      lista[i].disciplina = disciplina;
    }

    return lista;
  }

  @override
  Future<List<Tarefa>> buscarConcluidas() async {
    _db = await Connection.get();
    int isConcluida = 1;
    List<Map<String, dynamic>> resultado = await _db!
        .query('Tarefa', where: 'isConcluida = ?', whereArgs: [isConcluida]);

    //lista dos ids da disciplina
    List<int> listaIdsDisciplinas = List.generate(resultado.length, (i) {
      var linha = resultado[i];

      return linha['idDisciplina'];
    });
    //lista das tarefas sem a disciplina
    List<Tarefa> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      print(i);
      print(linha['id']);
      print('teste');
      print(linha['dataEntrega']);
      print('isconcluida');
      print(linha['isConcluida']);
      String data = linha['dataEntrega'];
      DateFormat dataFormat = DateFormat('yyyy-MM-dd hh:mm:ss');
      return Tarefa(
          id: linha['id'],
          dataEntrega: dataFormat.parse(data),
          descricao: linha['descricao'],
          disciplina: Disciplina(
            id: -1,
            nome: '',
            descricao: '',
          ),
          isConcluida: _getBoolDB(linha['isConcluida']));
    });
    //adicionar disciplinas nas tarefas
    for (int i = 0; i < listaIdsDisciplinas.length; i++) {
      var disciplina = await _buscarDisciplinaIdDb(listaIdsDisciplinas[i]);
      lista[i].disciplina = disciplina;
    }

    return lista;
  }

  bool _getBoolDB(int num) {
    if (num == 0) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<Tarefa> buscarPorId(int id) async {
    _db = await Connection.get();
    var resultado =
        await _db!.query("Tarefa", where: "id = ?", whereArgs: [id]);
    return resultado.isNotEmpty
        ? Tarefa.fromMap(resultado.first)
        : throw Exception("Não foi possível buscar uma tarefa pelo id=$id ");
  }

  @override
  Future<List<Tarefa>> buscarTodas() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db!.query('Tarefa');

    //lista dos ids da disciplina
    List<int> listaIdsDisciplinas = List.generate(resultado.length, (i) {
      var linha = resultado[i];

      return linha['idDisciplina'];
    });
    //lista das tarefas sem a disciplina
    List<Tarefa> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      print(i);
      print(linha['id']);
      print('teste');
      print(linha['dataEntrega']);
      print('isconcluida');
      print(linha['isConcluida']);
      String data = linha['dataEntrega'];
      DateFormat dataFormat = DateFormat('yyyy-MM-dd hh:mm:ss');
      return Tarefa(
          id: linha['id'],
          dataEntrega: dataFormat.parse(data),
          descricao: linha['descricao'],
          disciplina: Disciplina(
            id: -1,
            nome: '',
            descricao: '',
          ),
          isConcluida: _getBoolDB(linha['isConcluida']));
    });
    //adicionar disciplinas nas tarefas
    for (int i = 0; i < listaIdsDisciplinas.length; i++) {
      var disciplina = await _buscarDisciplinaIdDb(listaIdsDisciplinas[i]);
      lista[i].disciplina = disciplina;
    }

    return lista;
  }

  Future<Disciplina> _buscarDisciplinaIdDb(int id) async {
    _db = await Connection.get();
    var resultado =
        await _db!.query("Disciplina", where: "id = ?", whereArgs: [id]);
    return resultado.isNotEmpty
        ? Disciplina.fromMap(resultado.first)
        : throw Exception(
            "Não foi possível buscar uma disciplina pelo id=$id ");
  }

  @override
  remover(Tarefa tarefa) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM Tarefa WHERE id = ?';
    _db!.rawDelete(sql, [tarefa.id]);
  }

  @override
  salvar(Tarefa tarefa) async {
    print('INICIO DA TAREFA DAO IMPL');
    print(tarefa.id);
    print(tarefa.descricao);
    print(tarefa.dataEntrega.toString());
    print(tarefa.disciplina.id);
    print('FINAL DA TAREFA DAO IMPL');
    _db = await Connection.get();
    var sql;
    sql =
        'INSERT INTO Tarefa (descricao, dataEntrega, idDisciplina, isConcluida) VALUES ("${tarefa.descricao}","${tarefa.dataEntrega.toString()}", ${tarefa.disciplina.id}, 0)';
    if (tarefa.id == null || tarefa.id < 0) {
      int resultado = await _db!.rawInsert(sql);
      print("resultado $resultado");
    }
  }

  @override
  atualizar(Tarefa tarefa) async {
    _db = await Connection.get();
    var sql;
    sql =
        'UPDATE Tarefa SET descricao = ?, dataEntrega = ?, idDisciplina = ? WHERE id = ?';
    _db!.rawUpdate(sql, [
      tarefa.descricao,
      tarefa.dataEntrega.toString(),
      tarefa.disciplina.id,
      tarefa.id
    ]);
  }

  @override
  concluirTarefa(Tarefa tarefa) async {
    _db = await Connection.get();
    var sql;
    sql = 'UPDATE Tarefa SET isConcluida = ? WHERE id = ?';
    _db!.rawUpdate(sql, [1, tarefa.id]);
  }
}
