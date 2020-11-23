// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginController = BindInject(
  (i) => LoginController(userRepository: i<IUserRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool> _$validateFormComputed;

  @override
  bool get validateForm =>
      (_$validateFormComputed ??= Computed<bool>(() => super.validateForm,
              name: '_LoginControllerBase.validateForm'))
          .value;

  final _$formIsDurtyAtom = Atom(name: '_LoginControllerBase.formIsDurty');

  @override
  bool get formIsDurty {
    _$formIsDurtyAtom.reportRead();
    return super.formIsDurty;
  }

  @override
  set formIsDurty(bool value) {
    _$formIsDurtyAtom.reportWrite(value, super.formIsDurty, () {
      super.formIsDurty = value;
    });
  }

  final _$loginStatusAtom = Atom(name: '_LoginControllerBase.loginStatus');

  @override
  LoginStatus get loginStatus {
    _$loginStatusAtom.reportRead();
    return super.loginStatus;
  }

  @override
  set loginStatus(LoginStatus value) {
    _$loginStatusAtom.reportWrite(value, super.loginStatus, () {
      super.loginStatus = value;
    });
  }

  final _$emailAtom = Atom(name: '_LoginControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$signInAsyncAction = AsyncAction('_LoginControllerBase.signIn');

  @override
  Future signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void setFormIsDurty() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setFormIsDurty');
    try {
      return super.setFormIsDurty();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(dynamic status) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setStatus');
    try {
      return super.setStatus(status);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(dynamic email) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(dynamic password) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formIsDurty: ${formIsDurty},
loginStatus: ${loginStatus},
email: ${email},
password: ${password},
validateForm: ${validateForm}
    ''';
  }
}
