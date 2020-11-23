import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:microblogging/app/modules/news/news_controller.dart';
import 'package:microblogging/app/modules/news/news_module.dart';


void main() {
  initModule(NewsModule());
  NewsController newsController;
  setUp(() {
    newsController = NewsModule.to.get<NewsController>();
  });
  group('NewsController Test', () {

    test("Verifica se esta retornando as News", () async{
      await newsController.getNews();
      await newsController.news;
      expect(newsController.news.value, isNotNull);
    });

  });
}
