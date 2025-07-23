import 'dart:async';

import 'package:comet_chat_app/core/enums/auth_status.dart';
import 'package:comet_chat_app/features/auth/data/model/auth_results.dart';
import 'package:comet_chat_app/features/auth/domain/data%20src/auth_datasrc.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';
import 'package:comet_chat_app/core/utils/extensions/log_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleAuthsource implements AuthDatasrc {
  final SupabaseClient supabaseClient;

  GoogleAuthsource({required this.supabaseClient});
  @override
  @override
  Future<AuthResults> signIn({
    required AuthCredentialsBase authCredentials,
  }) async {
    try {
      // Completer halts the program and lets the async task complete before returning the results
      final completer = Completer<AuthResults>();
      final subscription = supabaseClient.auth.onAuthStateChange.listen((
        event,
      ) {
        final session = event.session;
        final user = event.session?.user;
        if (event.event == AuthChangeEvent.userUpdated ||
            event.event == AuthChangeEvent.signedIn) {
          event.log();
          final authresponse = AuthResponse(session: session, user: user);
          completer.complete(
            (session != null && user != null)
                ? AuthResults(
                    authStatus: AuthStatus.success,
                    message: 'Login successful',
                    authResponse: authresponse,
                  )
                : AuthResults(
                    authStatus: AuthStatus.failure,
                    message: 'Login failed',
                  ),
          );
        }
      });
      // 2. Trigger the OAuth flow
      final response = await supabaseClient.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'io.supabase.flutter://login-callback',
        authScreenLaunchMode: LaunchMode.platformDefault,
      );
      // 3. Wait for the event to complete
      final authResponse = await completer.future;

      await subscription.cancel();

      return authResponse;
    } catch (e) {
      e.log();
      return AuthResults(authStatus: AuthStatus.failure, message: e.toString());
    }
  }

  @override
  Future<AuthResults> signUp({required AuthCredentialsBase authCredentials}) {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<AuthResults> signOut() async {
    try {
      await supabaseClient.auth.signOut();
      return AuthResults(
        authStatus: AuthStatus.success,
        message: 'Logout successful',
      );
    } catch (e) {
      e.log();
      return AuthResults(
        authStatus: AuthStatus.failure,
        message: 'logout failed',
      );
    }
  }

  @override
  Future<AuthResults> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }
}
