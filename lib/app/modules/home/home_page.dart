import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:microblogging/app/modules/news/news_module.dart';
import 'package:microblogging/app/modules/posts/posts_module.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBuilder(
        animation: pageController,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            currentIndex: pageController?.page?.round() ?? 0,
            onTap: (index) {
              pageController.jumpToPage(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.local_post_office),
                label: "Posts"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.new_releases),
                label: "Novidades"
              ),
            ],  
          );
        }
      ),
      body: PageView(
        controller: pageController,
        children: [
          RouterOutlet(module: PostsModule(), keepAlive: false,),
          RouterOutlet(module: NewsModule(), keepAlive: false,)
        ],
      ),
    );
  }
}
