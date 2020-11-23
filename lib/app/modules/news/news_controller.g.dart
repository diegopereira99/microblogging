// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $NewsController = BindInject(
  (i) => NewsController(i<INewsRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsController on _NewsControllerBase, Store {
  final _$newsAtom = Atom(name: '_NewsControllerBase.news');

  @override
  ObservableFuture<List<NewsModel>> get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(ObservableFuture<List<NewsModel>> value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  final _$_NewsControllerBaseActionController =
      ActionController(name: '_NewsControllerBase');

  @override
  dynamic getNews() {
    final _$actionInfo = _$_NewsControllerBaseActionController.startAction(
        name: '_NewsControllerBase.getNews');
    try {
      return super.getNews();
    } finally {
      _$_NewsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
news: ${news}
    ''';
  }
}
