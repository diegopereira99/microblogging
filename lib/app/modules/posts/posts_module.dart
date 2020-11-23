import 'package:microblogging/app/modules/posts/add_post/add_post_page.dart';
import 'package:microblogging/app/repositories/post_repository.dart';
import 'package:microblogging/app/shared/database.dart';

import 'add_post/add_post_controller.dart';
import 'posts_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'posts_page.dart';

class PostsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $AddPostController,
        $PostsController,
        Bind((i)=>PostRepository(db: i.get<InternalDatabase>()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => PostsPage()),
        ModularRouter('/newPost', child: (_, args) => AddPostPage(post: args.data)),
      ];

  static Inject get to => Inject<PostsModule>.of();
}
