import 'dart:convert';

import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';

class Tarefa {
  late int id;
  late String descricao;
  late DateTime dataEntrega;
  late bool isConcluida;
  late Disciplina disciplina;

  Tarefa({
    required this.id,
    required this.descricao,
    required this.dataEntrega,
    required this.isConcluida,
    required this.disciplina,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'dataEntrega': dataEntrega,
      'isConcluida': isConcluida,
      'disciplina': disciplina.toMap(),
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      id: map['id'],
      descricao: map['descricao'],
      dataEntrega: map['dataEntrega'],
      isConcluida: map['isConcluida'],
      disciplina: Disciplina.fromMap(map['disciplina']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Tarefa.fromJson(String source) => Tarefa.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tarefa(id: $id, descricao: $descricao, dataEntrega: $dataEntrega, isConcluida: $isConcluida, disciplina: $disciplina)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tarefa &&
        other.id == id &&
        other.descricao == descricao &&
        other.dataEntrega == dataEntrega &&
        other.isConcluida == isConcluida &&
        other.disciplina == disciplina;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        descricao.hashCode ^
        dataEntrega.hashCode ^
        isConcluida.hashCode ^
        disciplina.hashCode;
  }
}
