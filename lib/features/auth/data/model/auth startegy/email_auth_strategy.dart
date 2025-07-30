import 'package:comet_chat_app/core/helpers/models/operation_results_model.dart';
import 'package:comet_chat_app/features/auth/data/data%20src/email_auth_datasrc.dart';
import 'package:comet_chat_app/features/auth/data/model/auth_results.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_startegy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmailAuthStrategy implements AuthStartegy {
  final EmailAuthSource emailAuthDatasrc;

  EmailAuthStrategy({required this.emailAuthDatasrc});
  @override
  Future<AuthResults> signIn({
    required AuthCredentialsBase authCredentials,
  }) async => await emailAuthDatasrc.signIn(authCredentials: authCredentials);

  @override
  Future<AuthResults> signOut() async => await emailAuthDatasrc.signOut();

  @override
  Future<AuthResults> deleteAccount() async =>
      await emailAuthDatasrc.deleteAccount();

  @override
  Future<OperationResults> signUp({required User user}) async =>
      await emailAuthDatasrc.signUp(user: user);
}
