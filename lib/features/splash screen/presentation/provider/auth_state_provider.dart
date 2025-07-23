import 'package:comet_chat_app/DI/shared_preferences_injection.dart';
import 'package:comet_chat_app/DI/supabase_auth_client_injection.dart';
import 'package:comet_chat_app/features/splash%20screen/data/repo/user_auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateRepoProvider = Provider<UserAuthStateImpl>((ref) {
  final sharedPreferences = ref.read(sharedPreferenceProvider);

  final supabaseClient = ref.read(supabaseAuthClientProvider);
  return UserAuthStateImpl(
    supabaseClient: supabaseClient,
    sharedPreferences: sharedPreferences,
  );
});
