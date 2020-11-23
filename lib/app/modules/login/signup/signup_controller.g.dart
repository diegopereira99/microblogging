// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SignupController = BindInject(
  (i) => SignupController(userRepository: i<IUserRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupController on _SignupControllerBase, Store {
  Computed<bool> _$validateFormComputed;

  @override
  bool get validateForm =>
      (_$validateFormComputed ??= Computed<bool>(() => super.validateForm,
              name: '_SignupControllerBase.validateForm'))
          .value;

  final _$formIsDurtyAtom = Atom(name: '_SignupControllerBase.formIsDurty');

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

  final _$loginStatusAtom = Atom(name: '_SignupControllerBase.loginStatus');

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

  final _$emailAtom = Atom(name: '_SignupControllerBase.email');

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

  final _$passwordAtom = Atom(name: '_SignupControllerBase.password');

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

  final _$nameAtom = Atom(name: '_SignupControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$signUpAsyncAction = AsyncAction('_SignupControllerBase.signUp');

  @override
  Future signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  final _$_SignupControllerBaseActionController =
      ActionController(name: '_SignupControllerBase');

  @override
  void setFormIsDurty() {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.setFormIsDurty');
    try {
      return super.setFormIsDurty();
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(dynamic status) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.setStatus');
    try {
      return super.setStatus(status);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(dynamic email) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(dynamic password) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(dynamic name) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.setName');
    try {
      return super.setName(name);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formIsDurty: ${formIsDurty},
loginStatus: ${loginStatus},
email: ${email},
password: ${password},
name: ${name},
validateForm: ${validateForm}
    ''';
  }
}
