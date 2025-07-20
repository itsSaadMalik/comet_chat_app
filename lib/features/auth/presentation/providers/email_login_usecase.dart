import 'package:comet_chat_app/features/auth/application/providers/email_authsrc_provider.dart';
import 'package:comet_chat_app/features/auth/domain/usecase/email_login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailLoginUsecaseProvider = Provider<EmailLoginUsecase>((ref) {
  final emailAuthSource = ref.read(emailAuthSourceProvider);

  return EmailLoginUsecase(emailAuthSource: emailAuthSource);
});
