import 'package:flutter/material.dart';
import 'package:microblogging/app/interfaces/IPost_interface.dart';
import 'package:microblogging/app/models/post_model.dart';
import 'package:microblogging/app/models/user_model.dart';
import 'package:microblogging/app/shared/constants.dart';
import 'package:microblogging/app/enums/status_enum.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'add_post_controller.g.dart';

@Injectable()
class AddPostController = _AddPostControllerBase with _$AddPostController;

abstract class _AddPostControllerBase with Store {
  
  UserModel user = Modular.get<UserModel>();
  PostModel post;

  final IPostRepository postRepository;
  _AddPostControllerBase(this.postRepository);
  

  TextEditingController contentController = TextEditingController();

  @observable
  String content = '';
  @action
  void setContent(content)=> this.content = content;
  @observable
  Status status;
  @action
  void setStatus(status)=>this.status = status;
  @observable
  bool isNew = true;
  @action
  void setIsNew(isNew)=>this.isNew = isNew;


  @computed
  bool get validateForm {
    if(this.content.isNotEmpty && this.content.length <= MAX_LINE_TO_POST)
      return true;

    return false;
  }

  void handlePost(){
    if(this.isNew)
      this.saveNewPost();
    else
      this.saveEditePost();
  }

  void saveNewPost() async{
    this.setStatus(Status.LOADING);
    this.post = PostModel();
    this.post.content = this.content.trim();
    this.post.userId = this.user.id;
    int savedPost = await this.postRepository.savePost(post);
    if(savedPost != null) {
      this.clearForm();
      this.setStatus(Status.COMPLETE);
    }else {
      this.setStatus(Status.ERROR);
    }
  }
  void saveEditePost() async{
    this.setStatus(Status.LOADING);
    this.post.content = this.content.trim();
    int editedPost = await this.postRepository.editePost(this.post);
    if(editedPost != null) {
      this.clearForm();
      this.setStatus(Status.COMPLETE);
    }else {
      this.setStatus(Status.ERROR);
    }
  }

  void clearForm() {
    this.setContent('');
    this.contentController.text = '';
  }


}
