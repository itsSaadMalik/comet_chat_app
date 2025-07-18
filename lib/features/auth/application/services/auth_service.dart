import 'package:comet_chat_app/features/auth/data/model/auth_results.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_startegy.dart';
import 'package:comet_chat_app/features/auth/domain/repo/auth_repository.dart';

class AuthService implements AuthRepository {
  final AuthStartegy authStartegy;

  AuthService({required this.authStartegy});

  @override
  Future<AuthResults> signInService({
    required AuthCredentialsBase authCredentials,
  }) async => await authStartegy.signIn(authCredentials: authCredentials);

  Future<AuthResults> signOutService(
    AuthCredentialsBase authCredentials,
  ) async => await authStartegy.signOut();
  @override
  Future<AuthResults> deleteAccount() async =>
      await authStartegy.deleteAccount();

  @override
  Future<AuthResults> signUpService({
    required AuthCredentialsBase authCredentials,
  }) async => authStartegy.signUp(authCredentials: authCredentials);
}
