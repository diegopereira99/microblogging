import 'package:microblogging/app/interfaces/ILogin_interface.dart';
import 'package:microblogging/app/models/user_model.dart';
import 'package:microblogging/app/shared/constants.dart';
import 'package:microblogging/app/shared/database.dart';

class LoginRespository extends ILoginRepository {

  final InternalDatabase db;

  LoginRespository({this.db});

  @override
  void logOut() {
    // TODO: implement logOut
  }

  @override
  Future<UserModel> signIn(String email, String password) async{
    try {
      List<Map<String, dynamic>> user = await this.db.database.query(
        USER_TABLE, 
        columns: ["id, name, email"], 
        where: "email = ? AND password = ?", 
        whereArgs: [email, password]
      );
      if(user != null) {
        return UserModel(
          email: user[0]["email"],
          id: user[0]["id"],
          name: user[0]["name"]
        );
      }else {
        throw("Erro ao fazer login");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
  
  @override
  Future<UserModel> signUp(String email, String password, String name) async{
    try {
      
      var userId = await this.db.database.insert(USER_TABLE, {
        "email": email,
        "password": password,
        "name": name
      });

      if(userId != null) {
        return UserModel(
          email: email,
          id: userId,
          name: name
        );
      }else {
        throw("Erro ao salvar usuário.");
      }

    } catch (e) {
      print(e);
      return null;
    }
  }
  
}