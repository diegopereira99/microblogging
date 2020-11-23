import 'package:microblogging/app/models/user_model.dart';
import 'package:microblogging/app/modules/login/login_module.dart';
import 'package:microblogging/app/shared/database.dart';
import 'package:microblogging/app/splash_screen.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:microblogging/app/app_widget.dart';

import 'modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind((i)=> InternalDatabase()),
        Bind((i)=> UserModel())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashScreen()),
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
