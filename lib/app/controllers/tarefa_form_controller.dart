import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';
import 'package:app_flutter_tarefas/app/models/tarefa_model.dart';
import 'package:app_flutter_tarefas/app/service/disciplina_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class TarefaFormController extends GetxController {
  var _disciplinaService = GetIt.I.get<DisciplinaService>();

  RxList<Disciplina> disciplinas = <Disciplina>[].obs;

  final formKey = GlobalKey<FormState>();
  RxBool atualizar = false.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  var entrega = TextEditingController();
  var descricao = TextEditingController();
  Rx<Disciplina> disciplinaSelecionada =
      Disciplina(id: -1, nome: '', descricao: '').obs;

  Rx<Tarefa> tarefa = Tarefa(
          id: -1,
          descricao: '',
          dataEntrega: DateTime.now(),
          isConcluida: false,
          disciplina: Disciplina(id: -1, descricao: '', nome: ''))
      .obs;

  reiniciarTarefa() {
    tarefa = Tarefa(
            id: -1,
            descricao: '',
            dataEntrega: DateTime.now(),
            isConcluida: false,
            disciplina: Disciplina(id: -1, descricao: '', nome: ''))
        .obs;
  }

  initAdicionarTarefa() {
    reiniciarTarefa();
    atualizar.value = false;
    entrega = TextEditingController();
    descricao = TextEditingController();
    selectedDate = DateTime.now().obs;
    this.refresh();
  }

  @override
  void onInit() {
    this.atualizarDisciplinas();
    super.onInit();
  }

  atualizarDadosCampos(bool atualizar) {
    if (atualizar == true) {
      this.atualizar.value = true;
      this.descricao.text = this.tarefa.value.descricao;
      this.entrega.text = this.tarefa.value.dataEntrega.day.toString() +
          "/" +
          this.tarefa.value.dataEntrega.month.toString() +
          "/" +
          this.tarefa.value.dataEntrega.year.toString();
      this.disciplinaSelecionada.value = this.tarefa.value.disciplina;
      this.disciplinaSelecionada.refresh();
      this.selectedDate.value = this.tarefa.value.dataEntrega;

      //formKey.currentState!.reset();
    } else {
      this.atualizar.value = false;
      this.descricao.text = '';
      this.entrega.text = '';
      this.selectedDate.value = DateTime.now();
      this.disciplinaSelecionada.value = this.disciplinas.first;
      this.atualizarDadosTarefa();
      this.refresh();
    }
  }

  atualizarDisciplinas() async {
    var lista = await _disciplinaService.getDisciplinas();
    disciplinas.value = lista;
    disciplinas.refresh();
    disciplinaSelecionada.value = disciplinas.first;
  }

  atualizarDadosTarefa() {
    this.tarefa.update((val) {
      val!.dataEntrega = this.selectedDate.value;
      val.descricao = this.descricao.text;
      val.disciplina = this.disciplinaSelecionada.value;
    });
  }
}
