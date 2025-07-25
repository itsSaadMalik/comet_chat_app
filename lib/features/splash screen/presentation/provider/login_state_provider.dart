import 'package:comet_chat_app/features/splash%20screen/presentation/provider/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginStateProvider = FutureProvider<bool>((ref) async {
  final authState = ref.watch(authStateRepoProvider);
  return await authState.isLoggedIn();
});
