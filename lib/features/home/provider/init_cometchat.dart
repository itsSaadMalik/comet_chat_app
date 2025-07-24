import 'package:comet_chat_app/core/utils/services/initialize_comet_chat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initializeCometChatProvider = FutureProvider.family<bool, String>((
  ref,
  String uid,
) async {
  return initializeCometChat(uid: uid);
});
