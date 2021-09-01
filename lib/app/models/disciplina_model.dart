import 'dart:convert';

class Disciplina {
  late int id;
  late String nome;
  late String descricao;

  Disciplina({
    required this.id,
    required this.nome,
    required this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
    };
  }

  factory Disciplina.fromMap(Map<String, dynamic> map) {
    return Disciplina(
      id: map['id'],
      nome: map['nome'],
      descricao: map['descricao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Disciplina.fromJson(String source) =>
      Disciplina.fromMap(json.decode(source));

  @override
  String toString() =>
      'Disciplina(id: $id, nome: $nome, descricao: $descricao)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Disciplina &&
        other.id == id &&
        other.nome == nome &&
        other.descricao == descricao;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ descricao.hashCode;
}
