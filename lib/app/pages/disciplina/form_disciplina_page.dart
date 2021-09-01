import 'package:app_flutter_tarefas/app/controllers/disciplina_controller.dart';
import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormDisciplinaPage extends StatelessWidget {
  final disciplinaController = Get.put(DisciplinaController());
  final _form = GlobalKey<FormState>();

  Disciplina? disciplina;
  String? _nome, _descricao;
  bool _atualizar = false;

  _carregarDadosDisciplina(context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      Map data = ModalRoute.of(context)!.settings.arguments as Map;
      disciplina = data['disciplina'];

      _nome = disciplina!.nome;
      _descricao = disciplina!.descricao;
      _atualizar = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarDadosDisciplina(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário Disciplina'),
        backgroundColor: Colors.deepPurple[700],
      ),
      body: Center(
        child: Container(
          width: 380,
          height: 400,
          child: Card(
            color: Colors.deepPurple[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 30,
                right: 30,
              ),
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    _getTextNome(),
                    _getTextFieldNome(),
                    SizedBox(
                      height: 16,
                    ),
                    _getTextDescricao(),
                    _getTextFieldDescricao(),
                    SizedBox(
                      height: 15,
                    ),
                    _getBotaoSalvar(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _getTextNome() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Nome',
        style: TextStyle(color: Colors.deepPurple[700], fontSize: 26),
      ),
    );
  }

  _getInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.deepPurple,
          width: 3.0,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.purple,
          width: 3.0,
        ),
      ),
    );
  }

  _getTextFieldNome() {
    return TextFormField(
      initialValue: _nome,
      style: TextStyle(color: Colors.black),
      decoration: _getInputDecoration(
        'Digite o nome da disciplina',
      ),
      onChanged: (value) {
        _nome = value;
      },
    );
  }

  _getTextDescricao() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Descrição',
        style: TextStyle(color: Colors.deepPurple[700], fontSize: 26),
      ),
    );
  }

  _getTextFieldDescricao() {
    return TextFormField(
      initialValue: _descricao,
      minLines: 2,
      maxLines: 5,
      style: TextStyle(color: Colors.black),
      decoration: _getInputDecoration('Digite a descrição da disciplina'),
      onChanged: (value) {
        _descricao = value;
      },
    );
  }

  _getBotaoSalvar(context) {
    String nomeBotao = 'Criar';
    if (_atualizar == true) {
      nomeBotao = 'Atualizar';
    }

    return SizedBox(
      width: 200,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          _form.currentState!.save();

          if (_atualizar == true) {
            print("atualizar");
            print(disciplina!.id);
            disciplina!.nome = _nome!;
            disciplina!.descricao = _descricao!;
            disciplinaController.atualizarDisciplina(disciplina!);
          } else {
            disciplina =
                Disciplina(id: -1, nome: _nome!, descricao: _descricao!);
            disciplinaController.adicionarDisciplina(disciplina!);
          }
          Navigator.of(context).pop();
        },
        child: Text(
          nomeBotao,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}
