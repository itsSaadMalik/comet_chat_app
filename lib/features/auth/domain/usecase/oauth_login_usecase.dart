import 'package:comet_chat_app/core/enums/auth_status.dart';
import 'package:comet_chat_app/core/enums/operation_results_enums.dart';
import 'package:comet_chat_app/core/enums/user_type_enums.dart';
import 'package:comet_chat_app/core/utils/services/get_uer_existing.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20credentials/oauth_credentials.dart';
import 'package:comet_chat_app/features/auth/data/model/auth_results.dart';
import 'package:comet_chat_app/features/auth/data/model/user_model.dart';
import 'package:comet_chat_app/features/auth/data/repo/cache_user__repo_impl.dart';
import 'package:comet_chat_app/features/auth/data/repo/user_repo_impl.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_startegy.dart';
import 'package:comet_chat_app/features/auth/domain/entity/login_usecase_strategy.dart';
import 'package:comet_chat_app/core/utils/extensions/log_extension.dart';
import 'package:comet_chat_app/features/splash%20screen/data/repo/user_auth_state.dart';

class OAuthLoginUsecase implements LoginUsecaseStrategy {
  final AuthStartegy authStrategy;
  final UserRepositoryImpl userRepositoryImpl;
  final CacheUserRepoImpl cacheUserRepoImpl;
  final UserExistenceService userExistenceService;
  final UserAuthStateImpl userAuthStateRepo;
  OAuthLoginUsecase({
    required this.authStrategy,
    required this.userRepositoryImpl,
    required this.cacheUserRepoImpl,
    required this.userExistenceService,
    required this.userAuthStateRepo,
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
      final creds = authCredentials as OAuthCredentials;
      final authResults = await authStrategy.signIn(
        authCredentials: authCredentials,
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
      loginResults.message?.log();
      loginResults.authStatus.name?.log();

      if (loginResults.authStatus == AuthStatus.success &&
          authResponse != null) {
        final user = authResponse.session?.user;
        if (user == null) {
          "user's null".log();
          return AuthResults(authStatus: AuthStatus.failure, message: '');
          // user.id.log();
        }
        final uid = authResponse.user!.id;

        final userExists = await userExistenceService.userExists(uid: uid);
        'user exists: $userExists'.log();

        UserModel? userData;

        // check if user doesn't exist, create a new one
        if (!userExists) {
          // create a new user in cometChat
          final cometChatSignup = await authStrategy.signUp(user: user);

          if (cometChatSignup.operationResultsStatus !=
              OperationResultsEnums.success) {
            // ?user account couldn be created so delete newly created
            final deletionResult = await authStrategy.deleteAccount();
            return deletionResult;
          }
          'new user Account created'.log();
        } else {
          //user does exists
          userData = await fetchUser(uid: authResponse.user!.id);
        }
        if (userData != null) {
          final saveLoginresults = await saveLogin();
          final cachingResults = await cacheUserLocally(user: userData);
          if (cachingResults && saveLoginresults) {
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

  @override
  Future<bool> saveLogin() async {
    try {
      return userAuthStateRepo.setLogin();
    } catch (e) {
      e.log();
      return false;
    }
  }
}
