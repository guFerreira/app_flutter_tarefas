import 'package:app_flutter_tarefas/app/injection.dart';
import 'package:app_flutter_tarefas/app/pages/aplicativo.dart';
import 'package:flutter/material.dart';

void main() {
  setupInjection();
  runApp(Aplicativo());
}
