import 'package:comet_chat_app/features/auth/data/model/auth_results.dart';
import 'package:comet_chat_app/features/auth/data/model/user_model.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';

abstract class LoginUsecaseStrategy {
  Future<AuthResults> login({required AuthCredentialsBase authCredentials});
  Future<UserModel?> fetchUser({required String uid});
  Future<bool> cacheUserLocally({required UserModel user});
  Future<AuthResults> loginFlow({required AuthCredentialsBase authCredentials});
}
