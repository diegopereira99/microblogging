import 'package:microblogging/app/interfaces/INews_interface.dart';
import 'package:microblogging/app/repositories/news_repository.dart';

import 'news_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'news_page.dart';

class NewsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $NewsController,
        Bind<INewsRepository>((i)=>NewsRepository())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => NewsPage()),
      ];

  static Inject get to => Inject<NewsModule>.of();
}
