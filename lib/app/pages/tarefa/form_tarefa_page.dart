import 'package:app_flutter_tarefas/app/controllers/tarefa_controller.dart';
import 'package:app_flutter_tarefas/app/controllers/tarefa_form_controller.dart';
import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';
import 'package:app_flutter_tarefas/app/models/tarefa_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormTarefaPage extends StatelessWidget {
  final tarefaFormController = Get.put(TarefaFormController());
  final tarefaController = Get.put(TarefaController());

  _carregarDadosDisciplina(context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      Map data = ModalRoute.of(context)!.settings.arguments as Map;
      tarefaFormController.tarefa.value = data['tarefa'];
      tarefaFormController.atualizarDadosCampos();
    }
  }

  @override
  Widget build(BuildContext context) {
    tarefaController.update();
    tarefaFormController.update();
    _carregarDadosDisciplina(context);
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
              padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
              child: Form(
                key: tarefaFormController.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _getTextDescricao(),
                      _getTextFormFieldDescricao(),
                      SizedBox(height: 16),
                      Column(
                        children: [
                          getDatePickerEntrega(context),
                          getDropDownButton(context),
                        ],
                      ),
                      _getBotaoSalvar(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  getDropDownButton(context) {
    return GetX<TarefaFormController>(
      builder: (controller) => DropdownButton<Disciplina>(
        value: controller.disciplinaSelecionada.value,
        onChanged: (Disciplina? d) {
          controller.disciplinaSelecionada.value = d!;
        },
        items: controller.disciplinas
            .map<DropdownMenuItem<Disciplina>>((Disciplina value) {
          return DropdownMenuItem<Disciplina>(
            value: value,
            child: Text(value.nome),
          );
        }).toList(),
      ),
    );
  }

  getDatePickerEntrega(context) {
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
                child: _showFieldDataEntrega(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showFieldDataEntrega(context) {
    print(tarefaFormController.selectedDate.value);
    return TextField(
      onTap: () {
        _selectDate(context);
      },
      controller: tarefaFormController.entrega,
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
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: tarefaFormController.selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != tarefaFormController.selectedDate.value) {
      print('dia');
      print(picked.day);
      tarefaFormController.selectedDate.value = picked;
      tarefaFormController.entrega.text = picked.day.toString() +
          "/" +
          picked.month.toString() +
          "/" +
          picked.year.toString();
      tarefaFormController.update();
    }
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
      controller: tarefaFormController.descricao,
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

  _getBotaoSalvar(context) {
    return SizedBox(
      width: 200,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          tarefaFormController.atualizarDadosTarefa();
          if (tarefaFormController.atualizar.value == true) {
            tarefaController
                .atualizarTarefas(tarefaFormController.tarefa.value);
            tarefaFormController.atualizar.value = false;
            tarefaFormController.refresh();
          } else {
            Tarefa t = tarefaFormController.tarefa.value;
            tarefaController.adicionarTarefas(t);

            tarefaFormController.formKey.currentState!.reset();
            //tarefaFormController.selectedDate.value = DateTime.now();
            tarefaFormController.atualizar.value = false;
            tarefaFormController.refresh();
            tarefaController.refresh();
          }

          tarefaFormController.reiniciarTarefa();
          tarefaFormController.refresh();
          tarefaController.refresh();
          Navigator.of(context).pop();
          //Get.off(TarefaPage());
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
