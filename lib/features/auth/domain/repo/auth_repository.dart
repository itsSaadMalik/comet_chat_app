import 'package:comet_chat_app/core/helpers/models/operation_results_model.dart';
import 'package:comet_chat_app/features/auth/data/model/auth_results.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<AuthResults> signInService({
    required AuthCredentialsBase authCredentials,
  });
  Future<OperationResults> signUpService({required User user});
  Future<AuthResults> signOutServcie();

  Future<AuthResults> deleteAccount();
}
