import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:microblogging/app/app_module.dart';
import 'package:microblogging/app/interfaces/IUser_interface.dart';
import 'package:microblogging/app/models/user_model.dart';
import 'package:microblogging/app/modules/login/login_controller.dart';
import 'package:microblogging/app/modules/login/login_module.dart';
import 'package:microblogging/app/modules/login/signup/signup_controller.dart';
import 'package:microblogging/app/repositories/user_repository.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {
  @override
  Future<UserModel> getUserByEmail(String email) async{
    if(email == "dimarcelo984@gmail.com") {
      return 
        Future.delayed(Duration(seconds: 1)).then((value) => UserModel(email: email, id: 1, name: "Diego Marcelo"));
    }else {
      return null;
    }
  }

  @override
  Future<UserModel> createUser(String email, String password, String name) async{
    return UserModel(
      email: email,
      id: 1231,
      name: name
    );
  }
}
void main() {
  initModule(AppModule());
  initModule(LoginModule(), changeBinds: [
    Bind<IUserRepository>((i) => MockUserRepository())
  ]);
  SignupController signUp;
  
  setUp(() {
    signUp = LoginModule.to.get<SignupController>();
  });

  group('SignupController Test', () {

    test("Validar email", () {
      signUp.formIsDurty = true;
      signUp.email = "diego123.com";
      expect(signUp.validateEmail(), equals("E-mail inválido"));
      expect(signUp.validateForm, equals(false));

      signUp.email = null;
      expect(signUp.validateEmail(), equals("Campo obrigatório"));
      expect(signUp.validateForm, equals(false));

      signUp.email = "diego123@gmail.com";
      expect(signUp.validateEmail(), equals(null));

    });

    test("Validar senha", () {
      signUp.formIsDurty = true;
      signUp.password = "123";
      expect(signUp.validatePassword(), equals("A senha deve ter no minimo 4 caracteres"));
      expect(signUp.validateForm, equals(false));

      signUp.password = null;
      expect(signUp.validatePassword(), equals("Campo obrigatório"));
      expect(signUp.validateForm, equals(false));

      signUp.password = "1234";
      expect(signUp.validatePassword(), equals(null));

    });

    test("Validar nome", () {
      signUp.formIsDurty = true;
      signUp.name = "di";
      expect(signUp.validateName(), equals("O nome deve ter no minimo 3 caracteres"));
      expect(signUp.validateForm, equals(false));

      signUp.name = null;
      expect(signUp.validateName(), equals("Campo obrigatório"));
      expect(signUp.validateForm, equals(false));

      signUp.name = "diego";
      expect(signUp.validateName(), equals(null));

    });

    test("Validar signUp de usuário com e-mail não existe", () async{
      signUp.password = "1234";
      signUp.email = "dimarcelo999@gmail.com"; //e-mail não existente
      signUp.name = "Diego";
      await signUp.signUp();
      expect(signUp.user.email, equals(signUp.email));
    });

    test("Validar signUp de usuário com e-mail e-mail existente", () async{
      signUp.user = UserModel();
      signUp.password = "1234";
      signUp.email = "dimarcelo984@gmail.com"; //e-mail existente
      signUp.name = "Diego";
      await signUp.signUp();
      expect(signUp.user.email, equals(null));
    });
    
  });
}
