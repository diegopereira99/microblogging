import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:microblogging/app/app_module.dart';

import 'package:microblogging/app/modules/posts/add_post/add_post_controller.dart';
import 'package:microblogging/app/modules/posts/posts_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  initModule(AppModule());
  initModule(PostsModule());
    AddPostController controller;
  
  setUp(() {
    controller = PostsModule.to.get<AddPostController>();
  });

  group('AddPostController Test', () {
    test("Verificar campo conteúdo", () {
      controller.content = "conteudo novo";
      expect(controller.validateForm, true);
    });
  });
}
