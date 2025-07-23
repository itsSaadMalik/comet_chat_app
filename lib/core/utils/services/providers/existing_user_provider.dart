import 'package:comet_chat_app/DI/supabase_database_injection.dart';
import 'package:comet_chat_app/core/utils/services/get_uer_existing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final existingUserProvider = Provider<UserExistenceService>((ref) {
  final supabaseDatabase = ref.read(supabaseClientProvider);
  return UserExistenceService(supabaseDatabase: supabaseDatabase);
});
