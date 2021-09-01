import 'package:app_flutter_tarefas/app/models/disciplina_model.dart';
import 'package:app_flutter_tarefas/app/service/disciplina_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class DisciplinaFormController extends GetxController {
  var _disciplinaService = GetIt.I.get<DisciplinaService>();

  final formKey = GlobalKey<FormState>();

  RxBool atualizar = false.obs;
  var nome = TextEditingController();
  var descricao = TextEditingController();

  Rx<Disciplina> disciplina = Disciplina(
    id: null!,
    nome: '',
    descricao: '',
  ).obs;

  @override
  void onInit() {
    super.onInit();
  }

  atualizarDadosCampos() {
    if (this.disciplina.value.id != null) {
      this.atualizar.value = true;
      this.descricao.text = this.disciplina.value.descricao;
      this.nome.text = this.disciplina.value.nome;

      formKey.currentState!.reset();
    }
  }

  atualizarDadosTarefa() {
    this.disciplina.update((val) {
      val!.nome = this.nome.text;
      val.descricao = this.descricao.text;
    });
  }
}
