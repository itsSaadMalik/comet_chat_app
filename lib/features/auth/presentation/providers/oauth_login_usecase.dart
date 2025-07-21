import 'package:comet_chat_app/core/enums/auth_types.dart';
import 'package:comet_chat_app/features/auth/application/providers/email_authsrc_provider.dart';
import 'package:comet_chat_app/features/auth/application/providers/facebook_auth_src_provider.dart';
import 'package:comet_chat_app/features/auth/application/providers/google_auth_src_provider.dart';
import 'package:comet_chat_app/features/auth/application/providers/remote_user_datasrc.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20startegy/email_auth_strategy.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20startegy/facebook_auth_strategy.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20startegy/google_auth_strategy.dart';
import 'package:comet_chat_app/features/auth/domain/usecase/oauth_login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final oAuthLoginUsecaseProvider = Provider.family<OAuthLoginUsecase, AuthType>((
  ref,
  AuthType authtype,
) {
  final emailAuthSource = ref.read(emailAuthSourceProvider);
  final googleAuthsource = ref.read(googleAuthSrcProvider);
  final facebookAuthsource = ref.read(facebookAuthSrcProvider);
  final remotedataSrc = ref.watch(remoteUserDataSrcProvider);
  switch (authtype) {
    case AuthType.email:
      return OAuthLoginUsecase(
        authStrategy: EmailAuthStrategy(emailAuthDatasrc: emailAuthSource),
        remoteUserDatasrcImpl: remotedataSrc,
      );
    case AuthType.google:
      return OAuthLoginUsecase(
        authStrategy: GoogleAuthStrategy(googleAuthsource: googleAuthsource),
        remoteUserDatasrcImpl: remotedataSrc,
      );
    case AuthType.facebook:
      return OAuthLoginUsecase(
        authStrategy: FacebookAuthStrategy(
          facebookAuthsource: facebookAuthsource,
        ),
        remoteUserDatasrcImpl: remotedataSrc,
      );
  }
});
