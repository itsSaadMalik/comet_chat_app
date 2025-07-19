import 'package:comet_chat_app/features/splash%20screen/presentation/provider/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authStateStreamProvider = StreamProvider<User?>((ref) {
  final authState = ref.watch(authStateRepoProvider);
  return authState.getAuthState();
});
