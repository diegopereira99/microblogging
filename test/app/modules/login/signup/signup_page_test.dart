import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:microblogging/app/app_module.dart';
import 'package:microblogging/app/modules/login/login_module.dart';

import 'package:microblogging/app/modules/login/signup/signup_page.dart';

void main() {
  initModule(AppModule());
  initModule(LoginModule());

  testWidgets('Pagina de cadastro deve ter um campo de e-mail', (tester) async {
     await tester.pumpWidget(buildTestableWidget(SignupPage()));
     final emailInput = find.byKey(Key("email_input"));
     expect(emailInput, findsOneWidget);
  });
  testWidgets('Pagina de cadastro deve ter um campo de senha', (tester) async {
     await tester.pumpWidget(buildTestableWidget(SignupPage()));
     final passwordInput = find.byKey(Key("password_input"));
     expect(passwordInput, findsOneWidget);
  });
  testWidgets('Pagina de cadastro deve ter um campo de nome', (tester) async {
     await tester.pumpWidget(buildTestableWidget(SignupPage()));
     final nameInput = find.byKey(Key("name_input"));
     expect(nameInput, findsOneWidget);
  });
  testWidgets('Pagina de cadastro deve ter um botão para se cadastrar', (tester) async {
     await tester.pumpWidget(buildTestableWidget(SignupPage()));
     final signupButton = find.byType(RaisedButton);
     expect(signupButton, findsOneWidget);
  });
}
