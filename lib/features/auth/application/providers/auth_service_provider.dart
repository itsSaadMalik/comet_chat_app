import 'package:comet_chat_app/core/enums/auth_types.dart';
import 'package:comet_chat_app/features/auth/application/providers/auth_strategy_provider.dart';
import 'package:comet_chat_app/features/auth/application/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider.family<AuthService, AuthType>((
  ref,
  AuthType authtype,
) {
  final authStrategy = ref.read(authStrategyProvider(authtype));

  return AuthService(authStartegy: authStrategy);
});
