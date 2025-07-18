import 'package:comet_chat_app/core/enums/auth_status.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthResults {
  final AuthStatus authStatus;
  final String? message;
  final AuthResponse? authResponse;

  AuthResults({
    required this.authStatus,
    required this.message,
    this.authResponse,
  });
}
