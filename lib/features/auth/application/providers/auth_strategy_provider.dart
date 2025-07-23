import 'package:comet_chat_app/core/enums/auth_types.dart';
import 'package:comet_chat_app/features/auth/application/providers/data%20source/email_authsrc_provider.dart';
import 'package:comet_chat_app/features/auth/application/providers/data%20source/facebook_auth_src_provider.dart';
import 'package:comet_chat_app/features/auth/application/providers/data%20source/google_auth_src_provider.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20startegy/email_auth_strategy.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20startegy/facebook_auth_strategy.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20startegy/google_auth_strategy.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_startegy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStrategyProvider = Provider.family<AuthStartegy, AuthType>((
  ref,
  AuthType authType,
) {
  AuthStartegy startegy;
  switch (authType) {
    case AuthType.email:
      startegy = EmailAuthStrategy(
        emailAuthDatasrc: ref.read(emailAuthSourceProvider),
      );
    case AuthType.google:
      startegy = GoogleAuthStrategy(
        googleAuthsource: ref.read(googleAuthSrcProvider),
      );
    case AuthType.facebook:
      startegy = FacebookAuthStrategy(
        facebookAuthsource: ref.read(facebookAuthSrcProvider),
      );
  }
  return startegy;
});
