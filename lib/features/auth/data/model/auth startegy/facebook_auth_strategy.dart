import 'package:comet_chat_app/core/helpers/models/operation_results_model.dart';
import 'package:comet_chat_app/features/auth/data/data%20src/facebook_auth_datasrc.dart';
import 'package:comet_chat_app/features/auth/data/model/auth_results.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_startegy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FacebookAuthStrategy implements AuthStartegy {
  final FacebookAuthsource facebookAuthsource;

  FacebookAuthStrategy({required this.facebookAuthsource});
  @override
  Future<AuthResults> signIn({
    required AuthCredentialsBase authCredentials,
  }) async => facebookAuthsource.signIn(authCredentials: authCredentials);

  @override
  Future<AuthResults> signOut() async => facebookAuthsource.signOut();

  @override
  Future<AuthResults> deleteAccount() async =>
      facebookAuthsource.deleteAccount();

  @override
  Future<OperationResults> signUp({required User user}) async =>
      facebookAuthsource.signUp(user: user);
}
