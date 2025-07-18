import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseAuthClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});
