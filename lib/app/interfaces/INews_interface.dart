import 'package:microblogging/app/models/news_model.dart';

abstract class INewsRepository {

  Future<List<NewsModel>> getNews();

}