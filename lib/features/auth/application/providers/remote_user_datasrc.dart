import 'package:comet_chat_app/DI/supabase_database_injection.dart';
import 'package:comet_chat_app/features/auth/data/data%20src/remote_user_datasrc_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteUserDataSrcProvider = Provider<RemoteUserDatasrcImpl>((ref) {
  final supabaseDatabase = ref.read(supabaseClientProvider);
  return RemoteUserDatasrcImpl(supabase: supabaseDatabase);
});
