import 'package:flutter/material.dart';
import 'package:microblogging/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(module: AppModule()));
}
