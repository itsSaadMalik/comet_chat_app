import 'package:comet_chat_app/DI/shared_preferences_injection.dart';
import 'package:comet_chat_app/features/auth/data/data%20src/local_datasrc_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localDataSrcProvider = Provider<LocalDatasrcImpl>((ref) {
  final localDb = ref.read(sharedPreferenceProvider);
  return LocalDatasrcImpl(sharedPreferences: localDb);
});
