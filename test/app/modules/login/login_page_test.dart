import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:microblogging/app/app_module.dart';
import 'package:microblogging/app/modules/login/login_module.dart';
import 'package:microblogging/app/modules/login/login_page.dart';

void main() {
  
  initModule(AppModule());
  initModule(LoginModule());

  testWidgets('Pagina de login deve ter um campo de e-mail', (tester) async {
     await tester.pumpWidget(buildTestableWidget(LoginPage()));
     final emailInput = find.byKey(Key("email_input"));
     expect(emailInput, findsOneWidget);
  });
  testWidgets('Pagina de login deve ter um campo de senha', (tester) async {
     await tester.pumpWidget(buildTestableWidget(LoginPage()));
     final passwordInput = find.byKey(Key("password_input"));
     expect(passwordInput, findsOneWidget);
  });
  testWidgets('Pagina de login deve ter um botão para logar', (tester) async {
     await tester.pumpWidget(buildTestableWidget(LoginPage()));
     final signInButton = find.text("Entrar");
     expect(signInButton, findsOneWidget);
  });
  testWidgets('Pagina de login deve ter um botão para se cadastrar', (tester) async {
     await tester.pumpWidget(buildTestableWidget(LoginPage()));
     final signUpButton = find.text("Cadastre-se");
     expect(signUpButton, findsOneWidget);
  });
}
