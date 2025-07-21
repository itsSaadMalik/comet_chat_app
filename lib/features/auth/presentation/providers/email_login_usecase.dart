import 'package:comet_chat_app/features/auth/application/providers/auth_strategy_provider.dart';
import 'package:comet_chat_app/features/auth/application/providers/email_auth_startegy_provider.dart';
import 'package:comet_chat_app/features/auth/application/providers/email_authsrc_provider.dart';
import 'package:comet_chat_app/features/auth/application/providers/remote_user_datasrc.dart';
import 'package:comet_chat_app/features/auth/domain/usecase/email_login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailLoginUsecaseProvider = Provider<EmailLoginUsecase>((ref) {
  final emailAuthRepo = ref.read(emailAuthStrategyProvider);
  final remoteUserRepo = ref.read();

  return EmailLoginUsecase(
    emailAuthStrategy: emailAuthRepo,
    userRepositoryImpl: null,
    cacheUserRepoImpl: null,
  );
});
