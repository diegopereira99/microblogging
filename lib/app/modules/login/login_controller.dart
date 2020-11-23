import 'package:microblogging/app/enums/login_enum.dart';
import 'package:microblogging/app/interfaces/IUser_interface.dart';
import 'package:microblogging/app/models/user_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  
  IUserRepository userRepository;
  UserModel user = Modular.get<UserModel>();

  _LoginControllerBase({this.userRepository});
  
  @observable
  bool formIsDurty = false;
  @action
  void setFormIsDurty()=>this.formIsDurty = true;
  @observable
  LoginStatus loginStatus;
  @action
  void setStatus(status)=>this.loginStatus = status;
  @observable
  String email;
  @action
  void setEmail(email)=> this.email = email;
  @observable
  String password;
  @action
  void setPassword(password)=> this.password = password;

  @action
  signIn() async{
    this.loginStatus = LoginStatus.LOADING;
    try {
      UserModel user = await this.userRepository.getUserByEmailAndPassowrd(
        this.email,
        this.password
      );
      if(user != null) {
        this.user.copyWith(
          email: user.email,
          id: user.id,
          name: user.name
        );
        Modular.navigator.pushReplacementNamed('/home');
      }else {
        this.loginStatus = LoginStatus.USER_NOT_FOUND;
      } 
    } catch (e) {
      this.loginStatus = LoginStatus.ERROR;
    }
  }

  String validateEmail() {
    if(!this.formIsDurty) 
      return null;
    
    if(email == null || email.isEmpty)
      return "Campo obrigatório";

    if(!email.contains('@'))
      return "E-mail inválido";
    
    return null;
  }

  String validatePassword() {
    if(!this.formIsDurty) 
      return null;

    if(password == null || password.isEmpty)
      return "Campo obrigatório";

    if(password.length < 4)
      return "A senha deve ter no minimo 4 caracteres";
    
    return null;
  }

  @computed
  bool get validateForm {
    if(!this.formIsDurty)
      return false;

    if(this.validateEmail() == null && this.validatePassword() == null)
      return true;

    return false;
  }

}
