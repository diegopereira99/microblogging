import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:microblogging/app/enums/status_enum.dart';
import 'package:microblogging/app/models/post_model.dart';
import 'package:microblogging/app/modules/posts/widgets/post_card.dart';
import 'package:microblogging/app/shared/fake_posts.dart';
import 'package:microblogging/app/shared/extensions.dart';
import 'posts_controller.dart';

class PostsPage extends StatefulWidget {
  
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends ModularState<PostsPage, PostsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async{
          await Navigator.pushNamed(context, '/newPost');
          controller.getPosts();        
        },
      ),
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Observer(
        builder: (_) {
          switch (controller.status) {
            case Status.LOADING:
              return
                Center(child: CircularProgressIndicator());  
              break;
            case Status.ERROR:
              return
                Center(
                  child: Text(
                    "Erro ao buscar Posts. Puxe para baixo para buscar novamente",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).accentColor
                    ),
                  )
                );
              break;
            case Status.COMPLETE:
              List<PostModel> postsToShow = controller.posts.length > 0 ? controller.posts : fakePosts;
              return
                RefreshIndicator(
                  onRefresh: () async{
                    controller.getPosts();
                    return null;
                  },
                  child: ListView(
                    padding: EdgeInsets.all(15),
                    children: postsToShow.mapIndexed((post, index) {
                      return PostCard(post, index);
                    }).toList()
                  ),
                );
            default:
              return
                Container();
          }
          
        },
      )
    );
  }
}
