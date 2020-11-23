// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AddPostController = BindInject(
  (i) => AddPostController(i<IPostRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddPostController on _AddPostControllerBase, Store {
  Computed<bool> _$validateFormComputed;

  @override
  bool get validateForm =>
      (_$validateFormComputed ??= Computed<bool>(() => super.validateForm,
              name: '_AddPostControllerBase.validateForm'))
          .value;

  final _$contentAtom = Atom(name: '_AddPostControllerBase.content');

  @override
  String get content {
    _$contentAtom.reportRead();
    return super.content;
  }

  @override
  set content(String value) {
    _$contentAtom.reportWrite(value, super.content, () {
      super.content = value;
    });
  }

  final _$statusAtom = Atom(name: '_AddPostControllerBase.status');

  @override
  Status get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(Status value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$isNewAtom = Atom(name: '_AddPostControllerBase.isNew');

  @override
  bool get isNew {
    _$isNewAtom.reportRead();
    return super.isNew;
  }

  @override
  set isNew(bool value) {
    _$isNewAtom.reportWrite(value, super.isNew, () {
      super.isNew = value;
    });
  }

  final _$_AddPostControllerBaseActionController =
      ActionController(name: '_AddPostControllerBase');

  @override
  void setContent(dynamic content) {
    final _$actionInfo = _$_AddPostControllerBaseActionController.startAction(
        name: '_AddPostControllerBase.setContent');
    try {
      return super.setContent(content);
    } finally {
      _$_AddPostControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(dynamic status) {
    final _$actionInfo = _$_AddPostControllerBaseActionController.startAction(
        name: '_AddPostControllerBase.setStatus');
    try {
      return super.setStatus(status);
    } finally {
      _$_AddPostControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsNew(dynamic isNew) {
    final _$actionInfo = _$_AddPostControllerBaseActionController.startAction(
        name: '_AddPostControllerBase.setIsNew');
    try {
      return super.setIsNew(isNew);
    } finally {
      _$_AddPostControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
content: ${content},
status: ${status},
isNew: ${isNew},
validateForm: ${validateForm}
    ''';
  }
}
