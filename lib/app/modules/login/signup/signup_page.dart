import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:microblogging/app/enums/login_enum.dart';
import 'package:mobx/mobx.dart';
import 'signup_controller.dart';

class SignupPage extends StatefulWidget {

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ModularState<SignupPage, SignupController> {
  //use 'controller' variable to access controller
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    
    autorun((_) {
      switch (controller.loginStatus) {
        case LoginStatus.ERROR:
          this.scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text("Erro ao cadastrar usuário. Tente novamente mais tarde")
            )
          );
          break;
        case LoginStatus.EMAIL_ALREADY_EXISTS:
          this.scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text("Esse e-mail ja está cadastrado")
            )
          );
          break;
        default:
      }
    });

    return Scaffold(
      key: this.scaffoldKey,
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Observer(
              builder: (_) {
                return TextField(
                  key: Key("name_input"),
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "Nome",
                    errorText: controller.validateName()
                  ),
                  onTap: controller.setFormIsDurty,
                  onChanged: controller.setName,
                );
              }
            ),
            SizedBox(height: 15),
            Observer(
              builder: (_) {
                return TextField(
                  key: Key("email_input"),
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "E-mail",
                    errorText: controller.validateEmail()
                  ),
                  onTap: controller.setFormIsDurty,
                  onChanged: controller.setEmail,
                );
              }
            ),
            SizedBox(height: 15),
            Observer(
              builder: (_) {
                return TextField(
                  key: Key("password_input"),
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "Senha",
                    errorText: controller.validatePassword()
                  ),
                  onTap: controller.setFormIsDurty,
                  onChanged: controller.setPassword,
                );
              }
            ),
            SizedBox(height: 40),
            Container(
              width: double.infinity,
              child: Container(
                height: 40,
                child: Observer(
                  builder: (_) {
                    return RaisedButton(
                      color: Theme.of(context).accentColor,
                      child: controller.loginStatus == LoginStatus.LOADING ? 
                        Container(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            strokeWidth: 2,
                          )
                        ) 
                        : 
                        Text(
                          "Cadastrar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      onPressed: controller.validateForm ? () {
                        controller.signUp();
                      } : null
                    );
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
