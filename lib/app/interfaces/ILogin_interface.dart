import 'package:microblogging/app/models/user_model.dart';

abstract class ILoginRepository {

  Future<UserModel> signIn(String email, String password);
  void logOut();
  Future<UserModel> signUp(String email, String password, String name);

}