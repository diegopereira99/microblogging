import 'package:microblogging/app/interfaces/INews_interface.dart';
import 'package:microblogging/app/models/news_model.dart';
import 'package:microblogging/app/repositories/news_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'news_controller.g.dart';

@Injectable()
class NewsController = _NewsControllerBase with _$NewsController;

abstract class _NewsControllerBase with Store {

  final INewsRepository newsRepository;

  _NewsControllerBase(this.newsRepository) {
    this.getNews();
  }

  @observable
  ObservableFuture<List<NewsModel>> news;

  @action
  getNews() {
    this.news =  this.newsRepository.getNews().asObservable();
  }

  
}
