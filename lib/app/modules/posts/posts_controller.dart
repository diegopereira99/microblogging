import 'package:microblogging/app/enums/status_enum.dart';
import 'package:microblogging/app/interfaces/IPost_interface.dart';
import 'package:microblogging/app/models/post_model.dart';
import 'package:microblogging/app/models/user_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'posts_controller.g.dart';

@Injectable()
class PostsController = _PostsControllerBase with _$PostsController;

abstract class _PostsControllerBase with Store {
  UserModel user = Modular.get<UserModel>();
  final IPostRepository postRepository;

  @observable
  List<PostModel> posts = ObservableList.of([]);
  
  @observable
  Status status;

  _PostsControllerBase(this.postRepository) {
    this.getPosts();
  }

  @action
  getPosts() async{
    this.status = Status.LOADING;
    List<PostModel> posts = await this.postRepository.getPosts();
    if(posts != null) {
      this.posts = posts;
      this.status = Status.COMPLETE;
    }else {
      this.status = Status.ERROR;
    }
  }

  @action 
  removePost(PostModel post, int index) async {
    if(await this.postRepository.deletePost(post)) {
      this.posts.removeAt(index);
      this.posts = this.posts;
    }
  }
}
