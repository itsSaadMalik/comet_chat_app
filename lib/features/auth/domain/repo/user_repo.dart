import 'package:comet_chat_app/features/auth/data/model/user_model.dart';

abstract class UserRepo {
  Future<UserModel> fetchUserData();
  Future<UserModel> updateUserData();
  Future<UserModel> createUser();
}
