import 'package:app_flutter_tarefas/app/database/connection/db_connection.dart';
import 'package:app_flutter_tarefas/app/database/dao/interfaces/disciplina_dao.dart';
import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';
import 'package:sqflite/sqlite_api.dart';

class DisciplinaDAOImpl implements DisciplinaDAO {
  Database? _db;

  @override
  Future<Disciplina> buscarPorId(int id) async {
    _db = await Connection.get();
    var resultado =
        await _db!.query("Disciplina", where: "id = ", whereArgs: [id]);
    return resultado.isNotEmpty
        ? Disciplina.fromMap(resultado.first)
        : throw Exception(
            "Não foi possível buscar uma disciplina pelo id=$id ");
  }

  @override
  Future<List<Disciplina>> buscarTodos() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db!.query('Disciplina');

    List<Disciplina> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Disciplina(
        id: linha['id'],
        nome: linha['nome'],
        descricao: linha['descricao'],
      );
    });

    return lista;
  }

  @override
  remover(Disciplina disciplina) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM Disciplina WHERE id = ?';
    _db!.rawDelete(sql, [disciplina.id]);
  }

  @override
  salvar(Disciplina disciplina) async {
    _db = await Connection.get();
    var sql;
    print(disciplina.id);
    if (disciplina.id == null || disciplina.id < 0) {
      sql = 'INSERT INTO Disciplina (nome, descricao) VALUES (?, ?)';
      _db!.rawInsert(sql, [
        disciplina.nome,
        disciplina.descricao,
      ]);
    }
  }

  @override
  atualizar(Disciplina disciplina) async {
    _db = await Connection.get();
    var sql;
    print(disciplina.id);
    sql = 'UPDATE Disciplina SET nome = ?, descricao = ? WHERE id = ?';
    _db!.rawUpdate(sql, [disciplina.nome, disciplina.descricao, disciplina.id]);
  }
}
