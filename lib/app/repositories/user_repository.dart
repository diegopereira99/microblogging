import 'package:microblogging/app/interfaces/IUser_interface.dart';
import 'package:microblogging/app/models/user_model.dart';
import 'package:microblogging/app/shared/constants.dart';
import 'package:microblogging/app/shared/database.dart';

class UserRepository extends IUserRepository {
  
  InternalDatabase db;
  UserRepository({db}) {
    this.db = db ?? InternalDatabase();
  }

  @override
  Future<UserModel> getUserByEmailAndPassowrd(String email, String password) async{
    try {
      List<Map<String, dynamic>> user = await this.db.database.query(
        USER_TABLE, 
        columns: ["id, name, email, dh_insert"], 
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
        throw("Usuário não encontrado");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
  @override
  Future<UserModel> getUserByEmail(String email) async{
    try {
      List<Map<String, dynamic>> user = await this.db.database.query(
        USER_TABLE, 
        columns: ["id, name, email, dh_insert"], 
        where: "email = ?", 
        whereArgs: [email]
      );
      if(user != null) {
        return UserModel(
          email: user[0]["email"],
          id: user[0]["id"],
          name: user[0]["name"]
        );
      }else {
        throw("Usuário não encontrado");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
  
  @override
  Future<UserModel> getUserById(int id) async {
    try {
      List<Map<String, dynamic>> user = await this.db.database.query(
        USER_TABLE, 
        columns: ["id, name, email"], 
        where: "id = ?", 
        whereArgs: [id]
      );
      if(user != null) {
        return UserModel(
          email: user[0]["email"],
          id: user[0]["id"],
          name: user[0]["name"]
        );
      }else {
        throw("Usuário não encontrado");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<UserModel> createUser(String email, String password, String name) async{
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
        throw("Erro ao criar usuário.");
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

}