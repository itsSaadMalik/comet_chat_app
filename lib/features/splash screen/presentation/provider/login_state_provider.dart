import 'package:comet_chat_app/DI/shared_preferences_injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginStateProvider = FutureProvider<bool>((ref) async {
  final sharedPref = ref.watch(sharedPreferenceProvider);
  return await sharedPref.getBool('is_logged_in') ?? false;
});
