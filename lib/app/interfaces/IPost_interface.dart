import 'package:microblogging/app/models/post_model.dart';

abstract class IPostRepository {

  Future<dynamic> savePost(PostModel post);
  Future<List<PostModel>> getPosts();
  Future<dynamic> editePost(PostModel post);
  Future<bool> deletePost(PostModel post);

}