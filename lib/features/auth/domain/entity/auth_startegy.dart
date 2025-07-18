import 'package:comet_chat_app/features/auth/data/model/auth_results.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';

abstract class AuthStartegy {
  Future<AuthResults> signIn({required AuthCredentialsBase authCredentials});
  Future<AuthResults> signUp({required AuthCredentialsBase authCredentials});

  Future<AuthResults> signOut();
  Future<AuthResults> deleteAccount();
}
