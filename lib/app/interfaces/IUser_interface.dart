import 'package:microblogging/app/models/user_model.dart';

abstract class IUserRepository {

  Future<UserModel> createUser(String email, String password, String name);
  Future<UserModel> getUserById(int id);
  Future<UserModel> getUserByEmailAndPassowrd(String email, String password);
  Future<UserModel> getUserByEmail(String email);


}