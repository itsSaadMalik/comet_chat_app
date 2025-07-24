import 'package:comet_chat_app/features/auth/data/model/auth_results.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';

abstract class AuthRepository {
  Future<AuthResults> signInService({
    required AuthCredentialsBase authCredentials,
  });
  Future<AuthResults> signUpService({
    required AuthCredentialsBase authCredentials,
  });
  Future<AuthResults> signOutServcie();

  Future<AuthResults> deleteAccount();
}
