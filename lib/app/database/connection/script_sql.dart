class ScriptsSQL {
  static String sqlTarefa =
      'CREATE TABLE Tarefa(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, descricao TEXT, dataEntrega TEXT, isConcluida BOOLEAN, idDisciplina INTEGER);'
      'FOREIGN KEY (idDisciplina) REFERENCES Disciplina (id) ON DELETE NO ACTION ON UPDATE NO ACTION';

  static String sqlDisciplina =
      'CREATE TABLE Disciplina(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, nome TEXT, descricao TEXT);';

  static String getScriptCriarDB() {
    return sqlDisciplina + " " + sqlDisciplina;
  }
}
