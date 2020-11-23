import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:microblogging/app/app_module.dart';
import 'package:microblogging/app/interfaces/IUser_interface.dart';
import 'package:microblogging/app/models/user_model.dart';

import 'package:microblogging/app/modules/login/login_controller.dart';
import 'package:microblogging/app/modules/login/login_module.dart';
import 'package:microblogging/app/repositories/user_repository.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {
  @override
  Future<UserModel> getUserByEmailAndPassowrd(String email, String password) async{
    if(email == "dimarcelo984@gmail.com" && password == "1234") {
      return 
        Future.delayed(Duration(seconds: 1)).then((value) => UserModel(email: email, id: 1, name: "Diego Marcelo"));
    }else {
      return null;
    }
    
  }
}
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initModule(AppModule());
  initModule(LoginModule(), changeBinds: [
    Bind<IUserRepository>((i) => MockUserRepository())
  ]);
  LoginController login;
  
  setUp(() {
    login = LoginModule.to.get<LoginController>();
  });

  group('LoginController Test', () {

    test("Validar email", () {
      login.formIsDurty = true;
      login.email = "diego123.com";
      expect(login.validateEmail(), equals("E-mail inválido"));
      expect(login.validateForm, equals(false));

      login.email = null;
      expect(login.validateEmail(), equals("Campo obrigatório"));
      expect(login.validateForm, equals(false));

      login.email = "diego123@gmail.com";
      expect(login.validateEmail(), equals(null));

    });

    test("Validar senha", () {
      login.formIsDurty = true;
      login.password = "123";
      expect(login.validatePassword(), equals("A senha deve ter no minimo 4 caracteres"));
      expect(login.validateForm, equals(false));

      login.password = null;
      expect(login.validatePassword(), equals("Campo obrigatório"));
      expect(login.validateForm, equals(false));

      login.password = "1234";
      expect(login.validatePassword(), equals(null));

    });

    test("Validar login de usuário", () async{
      login.password = "1234";
      login.email = "dimarcelo984@gmail.com";
      await login.signIn();
      expect(login.user.email, equals("dimarcelo984@gmail.com"));
    });
    
  });
}
