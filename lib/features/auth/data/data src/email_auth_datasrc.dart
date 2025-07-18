import 'package:comet_chat_app/core/enums/auth_status.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20credentials/email_credentials.dart';
import 'package:comet_chat_app/features/auth/data/model/auth_results.dart';
import 'package:comet_chat_app/features/auth/domain/data%20src/auth_datasrc.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';
import 'package:comet_chat_app/utils/extensions/log_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmailAuthSource implements AuthDatasrc {
  final SupabaseClient supabaseClient;

  EmailAuthSource({required this.supabaseClient});
  @override
  @override
  Future<AuthResults> signIn({
    required AuthCredentialsBase authCredentials,
  }) async {
    try {
      final emailAuthCredentials = authCredentials as EmailCredentials;
      final user = await supabaseClient.auth.signInWithPassword(
        password: emailAuthCredentials.pass,
        email: emailAuthCredentials.email,
      );
      if (user.user == null) {
        return AuthResults(
          authStatus: AuthStatus.failure,
          message: 'Auth failed',
        );
      }
      return AuthResults(
        authStatus: AuthStatus.success,
        message: 'Login successful',
        authResponse: user,
      );
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
