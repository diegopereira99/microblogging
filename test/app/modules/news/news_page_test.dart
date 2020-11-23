import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:microblogging/app/app_module.dart';
import 'package:microblogging/app/interfaces/INews_interface.dart';
import 'package:microblogging/app/models/news_model.dart';
import 'package:microblogging/app/modules/news/news_controller.dart';
import 'package:microblogging/app/modules/news/news_module.dart';

import 'package:microblogging/app/modules/news/news_page.dart';
import 'package:microblogging/app/repositories/news_repository.dart';
import 'package:mockito/mockito.dart';



class MockNewsRepository extends Mock implements NewsRepository {
  final defaultNews = [{
                "user": {
                  "name": "O Boticário",
                  "profile_picture": "https://pbs.twimg.com/profile_images/1240676323913347074/Gg09hEPx_400x400.jpg"
                },
                "message": {
                  "content": "Além disso, nossos funcionários e familiares receberão kits de proteção. Afinal, o cuidado começa aqui dentro, né?",
                  "created_at": "2020-02-02T16:10:33Z"
                }
              }];
  @override
  Future<List<NewsModel>> getNews() async{
    return Future.delayed(Duration(seconds: 1)).then((value) {
      return this.defaultNews.map((e) => NewsModel.fromJson(e)).toList();
    });
  }
} 

void main() {
  initModule(AppModule());
  initModule(NewsModule(), changeBinds:  [
    Bind<INewsRepository>((i)=> MockNewsRepository())
  ]);

  NewsController controller;
  setUp(() {
    controller = NewsModule.to.get<NewsController>();
  });

  testWidgets('Verifica se pagina de novidades foi carregada', (tester) async {
    await tester.pumpWidget(buildTestableWidget(NewsPage()));
    controller.getNews();
    await tester.pumpAndSettle();
    expect(find.byKey(Key('list_view_news')), findsOneWidget);
  });
}
