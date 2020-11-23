import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:microblogging/app/models/post_model.dart';
import 'package:microblogging/app/modules/posts/posts_controller.dart';

class PostCard extends StatelessWidget {

  final PostModel post;
  final int index;
  PostCard(this.post, this.index);
  final dateFormat = DateFormat('dd/MM/yyyy hh:mm');
  final controller = Modular.get<PostsController>();
  
  @override
  Widget build(BuildContext context) {
    List<String> splitedName = post.userName.split('');
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          if(controller.user.id == post.userId) ...{
            Positioned(
              right: 5,
              top: 5,
              child: PopupMenuButton(
                onSelected: (selected) async{
                  if(selected == "EDITAR") {
                    await Navigator.pushNamed(context, '/newPost', arguments: post);
                    controller.getPosts();     
                  }else {
                    this._buildDeleteDialog(context, post, index);     
                  }
                },
                itemBuilder: (context) {
                  return
                    [
                      PopupMenuItem(
                        child: Text("Editar"),
                        value: "EDITAR",
                      ),
                      PopupMenuItem(
                        child: Text("Excluir"),
                        value: "EXCLUIR",
                      ),
                    ];
                },
              )
            ),
          },
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      elevation: 0.5,
                      child: Container(
                        height: 45,
                        width: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "${splitedName[0]}${splitedName[1]}".toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.userName,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          this.dateFormat.format(DateTime.parse(post.dhInsert)),
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 10
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, top: 20, bottom: 25),
                  child: Text(
                    post.content,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
                // controller.user.id == post.userId ?
                //   Align(
                //     alignment: Alignment.centerRight,
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         FlatButton(
                //           onPressed: () async {
                //             this._buildDeleteDialog(context, post, index);     
                //           },
                //           child: Icon(
                //             Icons.delete,
                //             color: Theme.of(context).accentColor,
                //           ),
                //         ),
                //         FlatButton(
                //           onPressed: () async {
                //             await Navigator.pushNamed(context, '/newPost', arguments: post);
                //             controller.getPosts();        
                //           },
                //           child: Icon(
                //             Icons.edit,
                //             color: Theme.of(context).accentColor,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ) : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildDeleteDialog(BuildContext context, PostModel post, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Apagar post"),
          content: Text("Deseja realmente apagar esse post?"),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text('Apagar'),
              onPressed: () {
                controller.removePost(post, index);
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      }
    );
  }
}