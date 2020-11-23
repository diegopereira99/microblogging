import 'package:microblogging/app/modules/login/signup/signup_page.dart';

import 'signup/signup_controller.dart';
import 'package:microblogging/app/interfaces/IUser_interface.dart';
import 'package:microblogging/app/repositories/login_repository.dart';
import 'package:microblogging/app/repositories/user_repository.dart';
import 'package:microblogging/app/shared/database.dart';

import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SignupController,
        $LoginController,
        Bind<IUserRepository>((i) => UserRepository(db: i.get<InternalDatabase>()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
        ModularRouter('/signup', child: (_, args) => SignupPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
