import 'package:comet_chat_app/core/enums/auth_status.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20credentials/email_credentials.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20startegy/email_auth_strategy.dart';
import 'package:comet_chat_app/features/auth/data/model/auth_results.dart';
import 'package:comet_chat_app/features/auth/data/model/user_model.dart';
import 'package:comet_chat_app/features/auth/data/repo/cache_user__repo_impl.dart';
import 'package:comet_chat_app/features/auth/data/repo/user_repo_impl.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';
import 'package:comet_chat_app/features/auth/domain/entity/login_usecase_strategy.dart';
import 'package:comet_chat_app/core/utils/extensions/log_extension.dart';

class EmailLoginUsecase implements LoginUsecaseStrategy {
  final EmailAuthStrategy emailAuthStrategy;
  final UserRepositoryImpl userRepositoryImpl;
  final CacheUserRepoImpl cacheUserRepoImpl;

  EmailLoginUsecase({
    required this.emailAuthStrategy,
    required this.userRepositoryImpl,
    required this.cacheUserRepoImpl,
  });

  @override
  Future<bool> cacheUserLocally({required UserModel user}) async =>
      await cacheUserRepoImpl.cacheUserData(user: user);

  @override
  Future<UserModel?> fetchUser({required String uid}) async =>
      await userRepositoryImpl.fetchUserData(uid: uid);

  @override
  Future<AuthResults> login({
    required AuthCredentialsBase authCredentials,
  }) async {
    try {
      final creds = authCredentials as EmailCredentials;
      final authResults = await emailAuthStrategy.signIn(
        authCredentials: EmailCredentials(email: creds.email, pass: creds.pass),
      );

      return authResults;
    } catch (e) {
      e.log();
      return AuthResults(authStatus: AuthStatus.failure, message: e.toString());
    }
  }

  @override
  Future<AuthResults> loginFlow({
    required AuthCredentialsBase authCredentials,
  }) async {
    try {
      final loginResults = await login(authCredentials: authCredentials);
      final authResponse = loginResults.authResponse;
      if (loginResults.authStatus == AuthStatus.success &&
          authResponse != null) {
        final userData = await fetchUser(uid: authResponse.user!.id);
        if (userData != null) {
          final cachingResults = await cacheUserLocally(user: userData);
          if (cachingResults) {
            return AuthResults(
              authStatus: AuthStatus.success,
              message: 'user login successful',
            );
          }
        }
      }
      return AuthResults(
        authStatus: AuthStatus.failure,
        message: 'user login unsuccessful',
      );
    } catch (e) {
      e.log();
      return AuthResults(authStatus: AuthStatus.failure, message: e.toString());
    }
  }
}
