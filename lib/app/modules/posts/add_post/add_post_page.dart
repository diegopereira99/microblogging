import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:microblogging/app/models/post_model.dart';
import 'package:microblogging/app/shared/constants.dart';
import 'package:microblogging/app/enums/status_enum.dart';
import 'package:mobx/mobx.dart';
import 'add_post_controller.dart';

class AddPostPage extends StatefulWidget {

  final PostModel post;
  AddPostPage({this.post});
  
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends ModularState<AddPostPage, AddPostController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    if(widget.post != null) {
      controller.post = widget.post;
      controller.contentController.text = widget.post.content;
      controller.setContent(widget.post.content);
      controller.setIsNew(false);
    }
    super.initState();
  }
  
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    autorun((_) {
      switch (controller.status) {
        case Status.ERROR:
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Erro ao publicar post. Tente novamente mais tarde")
            )
          );
          break;
        case Status.COMPLETE:
          this.scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text("Post publicado com sucesso")
            )
          );
          break;
        default:
      }
    });

    return Scaffold(
      key: this.scaffoldKey,
      appBar: AppBar(
        title: Text("Novo Post"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              maxLines: null,
              minLines: 5,
              controller: controller.contentController,
              maxLength: MAX_LINE_TO_POST,
              onChanged: controller.setContent,
              decoration: InputDecoration(
                filled: true,
                labelText: "Conteúdo",
                alignLabelWithHint: true,
                hintText: "Digite aqui um post bem legal",
                hintStyle: TextStyle(
                  fontSize: 12
                )
              ),
            ),
            Observer(
              builder: (_) {
                return OutlinedButton(
                  onPressed: controller.validateForm ? () {
                    controller.handlePost();
                  } : null,
                  child: Text(
                    "Publicar Post",
                    style: TextStyle(
                      color: Theme.of(context).accentColor
                    ),
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
