import 'package:comet_chat_app/DI/supabase_auth_client_injection.dart';
import 'package:comet_chat_app/features/auth/data/data%20src/facebook_auth_datasrc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final googleAuthSrcProvider = Provider<FacebookAuthsource>((ref) {
  final supabaseClient = ref.read(supabaseAuthClientProvider);
  return FacebookAuthsource(supabaseClient: supabaseClient);
});
