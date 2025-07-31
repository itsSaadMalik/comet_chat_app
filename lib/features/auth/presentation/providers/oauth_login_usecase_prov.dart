import 'package:comet_chat_app/core/enums/auth_types.dart';
import 'package:comet_chat_app/core/utils/services/providers/existing_user_provider.dart';
import 'package:comet_chat_app/features/auth/application/providers/data%20source/email_authsrc_provider.dart';
import 'package:comet_chat_app/features/auth/application/providers/data%20source/facebook_auth_src_provider.dart';
import 'package:comet_chat_app/features/auth/application/providers/data%20source/google_auth_src_provider.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20startegy/email_auth_strategy.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20startegy/facebook_auth_strategy.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20startegy/google_auth_strategy.dart';
import 'package:comet_chat_app/features/auth/domain/usecase/oauth_login_usecase.dart';
import 'package:comet_chat_app/features/auth/presentation/providers/cache_repo_provider.dart';
import 'package:comet_chat_app/features/auth/presentation/providers/user_repo_provider.dart';
import 'package:comet_chat_app/features/splash%20screen/presentation/provider/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final oAuthLoginUsecaseProvider = Provider.family<OAuthLoginUsecase, AuthType>((
  ref,
  AuthType authtype,
) {
  final emailAuthSource = ref.read(emailAuthSourceProvider);
  final googleAuthsource = ref.read(googleAuthSrcProvider);
  final facebookAuthsource = ref.read(facebookAuthSrcProvider);

  final userRepo = ref.read(userRepoProvider);
  final cacheRepo = ref.read(cacheRepoProvider);
  final useExistenceService = ref.read(existingUserProvider);
  final authStateRepo = ref.read(authStateRepoProvider);

  switch (authtype) {
    case AuthType.email:
      return OAuthLoginUsecase(
        authStrategy: EmailAuthStrategy(emailAuthDatasrc: emailAuthSource),
        cacheUserRepoImpl: cacheRepo,
        userRepositoryImpl: userRepo,
        userExistenceService: useExistenceService,
        userAuthStateRepo: authStateRepo,
      );
    case AuthType.google:
      return OAuthLoginUsecase(
        authStrategy: GoogleAuthStrategy(googleAuthsource: googleAuthsource),
        cacheUserRepoImpl: cacheRepo,
        userRepositoryImpl: userRepo,
        userExistenceService: useExistenceService,
        userAuthStateRepo: authStateRepo,
      );
    case AuthType.facebook:
      return OAuthLoginUsecase(
        authStrategy: FacebookAuthStrategy(
          facebookAuthsource: facebookAuthsource,
        ),
        cacheUserRepoImpl: cacheRepo,
        userRepositoryImpl: userRepo,
        userExistenceService: useExistenceService,
        userAuthStateRepo: authStateRepo,
      );
  }
});
