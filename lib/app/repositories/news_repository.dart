import 'package:dio/dio.dart';
import 'package:microblogging/app/interfaces/INews_interface.dart';
import 'package:microblogging/app/models/news_model.dart';
import 'package:microblogging/app/shared/constants.dart';

class NewsRepository extends INewsRepository {
  
  Dio dio;

  NewsRepository() {
    this.dio = Dio();
  }

  Future<List<NewsModel>> getNews() async{
    try {
      Response response =  await this.dio.get(NEWS_API);
      List<NewsModel> news = List();
      if(response.statusCode == 200) {
        news = (response.data["news"] as List).map((e) => NewsModel.fromJson(e)).toList();
        return news;
      }else {
        throw("Não foi possível buscar as novidades");
      } 
    } catch (e) {
      print(e);
      return null;
    }
  }
  
}