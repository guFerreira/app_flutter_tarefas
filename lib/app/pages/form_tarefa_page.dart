import 'package:app_flutter_tarefas/app/controllers/disciplina_controller.dart';
import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';
import 'package:app_flutter_tarefas/app/models/tarefa_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormTarefaPage extends StatefulWidget {
  const FormTarefaPage({Key? key}) : super(key: key);

  @override
  _FormTarefaPageState createState() => _FormTarefaPageState();
}

class _FormTarefaPageState extends State<FormTarefaPage> {
  DateTime selectedDate = DateTime.now();
  var _entrega = TextEditingController();
  var _descricao = TextEditingController();
  var _disciplina = TextEditingController();

  final _form = GlobalKey<FormState>();

  bool atualizar = false;
  int idDisciplina = 0;
  int idTarefa = 0;
  Tarefa? tarefa;

  _carregarDadosDisciplina(context) {
    DisciplinaController dc =
        Provider.of<DisciplinaController>(context, listen: false);

    if (ModalRoute.of(context)!.settings.arguments != null) {
      Map data = ModalRoute.of(context)!.settings.arguments as Map;
      tarefa = data['tarefa'];
      idTarefa = data['id'];

      idDisciplina = dc.getIdDisciplinabyTarefa(tarefa!);
      dc.disciplinas.first = dc.disciplinas.elementAt(idDisciplina);
      dc.notifyListeners();

      _descricao.text = tarefa!.getDescricao();
      selectedDate = tarefa!.getDataEntrega();
      atualizar = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário Tarefas'),
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
                    _getTextDescricao(),
                    _getTextFormFieldDescricao(),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: [
                        getDatePickerEntrega(),
                        getDropDownButton(context),
                      ],
                    ),
                    _getBotaoSalvar(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  getDropDownButton(context) {
    DisciplinaController dc =
        Provider.of<DisciplinaController>(context, listen: false);
    List<Disciplina> disciplinas = [];

    for (int i = 0; i < dc.disciplinas.length; i++) {
      Disciplina d = dc.disciplinas[i];
      disciplinas.add(d);
    }

    Disciplina _primeiroDropdown = dc.disciplinas.first;
    return DropdownButton<Disciplina>(
      value: _primeiroDropdown,
      onChanged: (Disciplina? d) {
        setState(() {
          int pos1 = 0;
          Disciplina d1 = Disciplina('a', '_descricao', []);
          for (int i = 0; i < dc.disciplinas.length; i++) {
            if (dc.disciplinas.elementAt(i) == d) {
              pos1 = i;
              d1 = dc.disciplinas.elementAt(i);
            }
          }
          int pos2 = 0;

          Disciplina d2 = Disciplina('a', '_descricao', []);
          for (int i = 0; i < dc.disciplinas.length; i++) {
            if (dc.disciplinas.elementAt(i) == _primeiroDropdown) {
              pos2 = i;
              d2 = dc.disciplinas.elementAt(i);
            }
          }

          dc.disciplinas[pos1] = d2;
          dc.disciplinas[pos2] = d1;
          dc.notifyListeners();
          _primeiroDropdown = d!;
        });
      },
      items: disciplinas.map<DropdownMenuItem<Disciplina>>((Disciplina value) {
        return DropdownMenuItem<Disciplina>(
          value: value,
          child: Text(value.nome),
        );
      }).toList(),
    );
  }

  getDatePickerEntrega() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Data de Entrega',
              style: TextStyle(color: Colors.deepPurple[700], fontSize: 20),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 60,
              width: 144,
              child: Container(
                child: TextField(
                  onTap: () {
                    return _selectDate(context);
                  },
                  controller: _entrega,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 5),
                    prefixIcon: const Icon(
                      Icons.calendar_today,
                      color: Colors.deepPurple,
                      size: 18,
                    ),
                    hintText: 'dd/mm/aaaa',
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
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
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _entrega.text = picked.day.toString() +
            "/" +
            picked.month.toString() +
            "/" +
            picked.year.toString();
      });
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

  _getTextFormFieldDescricao() {
    return TextFormField(
      controller: _descricao,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: 'Digite a descrição da tarefa',
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
      ),
    );
  }

  _getBotaoSalvar() {
    return SizedBox(
      width: 200,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          //_form.currentState!.save();
          DisciplinaController dc =
              Provider.of<DisciplinaController>(context, listen: false);
          if (atualizar == true) {
            dc.atualizarTarefa(tarefa!,idTarefa,idDisciplina);
          } else {
            dc.adicionarTarefa(Tarefa(_descricao.text, selectedDate, false));
          }

          dc.notifyListeners();
          Navigator.of(context).pop();
        },
        child: Text(
          'Salvar',
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
