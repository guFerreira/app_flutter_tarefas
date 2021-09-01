import 'package:app_flutter_tarefas/app/database/connection/script_sql.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Connection {
  static Database? _db;

  static Future<Database> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'apptarefa.db');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.delete("Disciplina");
          db.execute(ScriptsSQL.sqlDisciplina);
          db.execute(ScriptsSQL.sqlTarefa);
          String nome = "RP1";
          String descricao = "Disciplina sobre engenharia de requisitos";
          db.rawInsert(
              'INSERT INTO Disciplina(nome, descricao) VALUES("$nome", "$descricao")');
        },
        onConfigure: _onConfigure,
      );
    }
    //_db!.execute(ScriptsSQL.getScriptCriarDB());
    //_db!.rawInsert(
    //   'INSERT INTO Disciplina(nome, descricao) VALUES("RP1", "Engenharia de requisitos")');
    //_db!.rawInsert(
    //    'INSERT INTO Tarefa(descricao,dataEntrega,isConcluida,idDisciplina) VALUES("entregar relatorio", "2021-09-01 00:00:00.000",0,1)');
    //_db!.execute("DROP TABLE IF EXISTS Tarefa");
    //_db!.execute("DROP TABLE IF EXISTS Disciplina");
    //_db!.execute(ScriptsSQL.sqlTarefa);
    //_db!.rawDelete('DELETE FROM Tarefa WHERE id != ?', [1]);
    return _db!;
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }
}
