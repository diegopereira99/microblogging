import 'package:microblogging/app/interfaces/IPost_interface.dart';
import 'package:microblogging/app/models/post_model.dart';
import 'package:microblogging/app/shared/constants.dart';
import 'package:microblogging/app/shared/database.dart';
import 'package:sqflite/sqflite.dart';

class PostRepository extends IPostRepository {

  final InternalDatabase db;

  PostRepository({this.db});


  Future<int> savePost(PostModel post) async {
    try {
      int insertedId = await this.db.database.insert(POST_TABLE, {
        "content": post.content,
        "user_id": post.userId,
      });
      if(insertedId != null)
        return insertedId;
      
      throw("Erro ao salvar post");
      
    }catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future editePost(PostModel post) async{
    try {
      int updatedId = await this.db.database.update(POST_TABLE, {
          "content": post.content,
          "user_id": post.userId,
          "dh_insert": DateTime.now().toString()
        },
        where: "id = ?",
        whereArgs: [post.id ]
      );
      if(updatedId != null)
        return updatedId;
      
      throw("Erro ao alterar post");
      
    }catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<PostModel>> getPosts() async{
    try {
      List<Map<String, dynamic>> posts = await this.db.database.rawQuery(
        """
          select p.*, u.id as user_id, u.name as user_name from posts p
          inner join users u
            on p.user_id = u.id
          order by p.dh_insert desc
        """
      );
      if(posts != null) {
        return posts.map((e) => PostModel.fromJson(e)).toList();
      }else {
        throw("Nenhnum post encontrado");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<bool> deletePost(PostModel post) async{
    try {
      int deletedPost = await this.db.database.delete(POST_TABLE, 
        where: "id = ?",
        whereArgs: [post.id]
      );
      if(deletedPost != null) {
        return true;
      }else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

}