import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:microblogging/app/modules/news/widgets/news_card.dart';
import 'package:mobx/mobx.dart';
import 'news_controller.dart';

class NewsPage extends StatefulWidget {

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends ModularState<NewsPage, NewsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novidades"),
      ),
      body: Observer(
        builder: (_) {
          switch (controller.news.status) {
            case FutureStatus.pending:
              return
                Center(child: CircularProgressIndicator());   
              break;
            case FutureStatus.rejected:
              return
                Center(
                  child: Text(
                    "Erro ao buscar novidades. Puxe para baixo para buscar novamente",
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).accentColor
                    ),
                  )
                ); 
              break;
            case FutureStatus.fulfilled:
              if(controller.news.value == null) {
                return
                  Center(
                    child: Text(
                      "Não encontramos nenhuma novidade. Puxe para baixo para buscar novamente",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).accentColor
                      ),
                    )
                  );
              }
              return
                RefreshIndicator(
                  onRefresh: () async{
                    controller.getNews();
                    return null;
                  },
                  child: ListView(
                    key: Key('list_view_news'),
                    padding: EdgeInsets.all(15),
                    children: controller.news.value.map((news) {
                      return NewsCard(news: news);
                    }).toList()
                  ),
                );
              break;
            
            default:
              return
                Container();
          }
        },
      )
    );
  }
}
