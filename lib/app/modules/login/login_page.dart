import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:microblogging/app/enums/login_enum.dart';
import 'package:microblogging/app/enums/status_enum.dart';
import 'package:mobx/mobx.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    autorun((_) {
      switch (controller.loginStatus) {
        case LoginStatus.ERROR:
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Erro ao fazer login. Tente novamente mais tarde")
            )
          );
          break;
        case LoginStatus.USER_NOT_FOUND:
          this.scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text("Usuário não encontrado")
            )
          );
          break;
        default:
      }
    });

    return Scaffold(
      key: this.scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              color: Theme.of(context).accentColor,
              child: Center(
                child: Text(
                  "MicroBlogging",
                  style: TextStyle(
                    fontFamily: "DancingScript",
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
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
                    child: Observer(
                      builder: (_) {
                        return Container(
                          height: 40,
                          child: RaisedButton(
                            disabledColor: Theme.of(context).primaryColor.withOpacity(0.5),
                            color: Theme.of(context).primaryColor,
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
                              "Entrar",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: controller.validateForm ? () {
                              controller.signIn();
                            } : null
                          ),
                        );
                      }
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    child: Container(
                      height: 40,
                      child: RaisedButton(
                        key: Key('signup_button'),
                        color: Theme.of(context).accentColor,
                        child: Text(
                          "Cadastre-se",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Modular.link.pushNamed('/signup');
                        }
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
