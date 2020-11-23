import 'package:microblogging/app/enums/login_enum.dart';
import 'package:microblogging/app/interfaces/IUser_interface.dart';
import 'package:microblogging/app/models/user_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'signup_controller.g.dart';

@Injectable()
class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {
  
  
  IUserRepository userRepository;
  UserModel user = Modular.get<UserModel>();

  _SignupControllerBase({this.userRepository});


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
  @observable
  String name;
  @action
  void setName(name)=> this.name = name;



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
 
  String validateName() {
    if(!this.formIsDurty) 
      return null;

    if(name == null || name.isEmpty)
      return "Campo obrigatório";

    if(name.length < 3)
      return "O nome deve ter no minimo 3 caracteres";
    
    return null;
  }

  @computed
  bool get validateForm {
    if(!this.formIsDurty)
      return false;

    if(this.validateEmail() == null && this.validatePassword() == null && this.validateName() == null)
      return true;

    return false;
  }

  @action
  signUp() async{
    this.loginStatus = LoginStatus.LOADING;
    try {
      if((await this.userRepository.getUserByEmail(this.email) != null)) {
        this.loginStatus = LoginStatus.EMAIL_ALREADY_EXISTS;
        return null;
      }  
      UserModel user = await this.userRepository.createUser(this.email, this.password, this.name);
      if(user != null) {
        this.user.copyWith(
          email: user.email,
          id: user.id,
          name: user.name
        );
        Modular.navigator.pushReplacementNamed('/home');
      }else {
        this.loginStatus = LoginStatus.ERROR;
      } 
      
    } catch (e) {
      this.loginStatus = LoginStatus.ERROR;
    }
  }
}
