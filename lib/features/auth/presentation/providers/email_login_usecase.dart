import 'package:comet_chat_app/features/auth/application/providers/email_auth_startegy_provider.dart';
import 'package:comet_chat_app/features/auth/presentation/providers/cache_repo_provider.dart';
import 'package:comet_chat_app/features/auth/presentation/providers/user_repo_provider.dart';
import 'package:comet_chat_app/features/auth/domain/usecase/email_login_usecase.dart';
import 'package:comet_chat_app/features/splash%20screen/presentation/provider/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailLoginUsecaseProvider = Provider<EmailLoginUsecase>((ref) {
  final emailAuthRepo = ref.read(emailAuthStrategyProvider);
  final userRepo = ref.read(userRepoProvider);
  final cacheRepo = ref.read(cacheRepoProvider);
  final authStateRepo = ref.read(authStateRepoProvider);

  return EmailLoginUsecase(
    emailAuthStrategy: emailAuthRepo,
    userRepositoryImpl: userRepo,
    cacheUserRepoImpl: cacheRepo,
    userAuthState: authStateRepo,
  );
});
