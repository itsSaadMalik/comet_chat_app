import 'package:comet_chat_app/features/auth/application/providers/email_authsrc_provider.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20startegy/email_auth_strategy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailAuthStrategyProvider = Provider<EmailAuthStrategy>((ref) {
  final emailAuthDataSrc = ref.read(emailAuthSourceProvider);

  return EmailAuthStrategy(emailAuthDatasrc: emailAuthDataSrc);
});
