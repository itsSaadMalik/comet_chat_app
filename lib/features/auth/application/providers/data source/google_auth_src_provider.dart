import 'package:comet_chat_app/DI/supabase_auth_client_injection.dart';
import 'package:comet_chat_app/features/auth/data/data%20src/google_auth_datasrc.dart';
import 'package:comet_chat_app/features/auth/presentation/providers/user_repo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final googleAuthSrcProvider = Provider<GoogleAuthsource>((ref) {
  final supabaseClient = ref.read(supabaseAuthClientProvider);
  final userRepo = ref.read(userRepoProvider);

  return GoogleAuthsource(
    supabaseClient: supabaseClient,
    userRepositoryImpl: userRepo,
  );
});
