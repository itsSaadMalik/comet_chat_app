import 'package:comet_chat_app/core/enums/operation_results_enums.dart';
import 'package:comet_chat_app/core/enums/user_model_enums.dart';
import 'package:comet_chat_app/core/helpers/fieldnames/user_model_fieldnames.dart';
import 'package:comet_chat_app/core/helpers/models/operation_results_model.dart';
import 'package:comet_chat_app/features/auth/data/model/user_model.dart';
import 'package:comet_chat_app/features/auth/domain/data%20src/remote_user_datasrc.dart';
import 'package:comet_chat_app/core/utils/extensions/log_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteUserDatasrcImpl implements RemoteUserDatasrc {
  final Supabase supabase;

  RemoteUserDatasrcImpl({required this.supabase});

  @override
  Future<OperationResults> createUser({required UserModel user}) async {
    try {
      await supabase.client.from('users').insert(user.toMap());

      return OperationResults(
        operationResultsStatus: OperationResultsEnums.success,
        message: 'created new user account',
      );
    } catch (e) {
      e.log();
      return OperationResults(
        operationResultsStatus: OperationResultsEnums.failure,
        message: 'some error with creating user account',
      );
    }
  }

  @override
  Future<UserModel?> fetchUserData({required String uid}) async {
    try {
      final userData = await supabase.client
          .from('users')
          .select()
          .eq(UserModelEnums.uid.fieldname, uid)
          .single();
      return UserModel.fromMap(userData);
    } catch (e) {
      e.log();
      return null;
    }
  }

  @override
  Future<OperationResults> updateUserData({required UserModel user}) async {
    try {
      await supabase.client
          .from('users')
          .update(user.toMap())
          .eq(UserModelEnums.uid.fieldname, user.uid);

      return OperationResults(
        operationResultsStatus: OperationResultsEnums.failure,
        message: 'created new user account',
      );
    } catch (e) {
      e.log();
      return OperationResults(
        operationResultsStatus: OperationResultsEnums.failure,
        message: 'some error with creating user account',
      );
    }
  }
}
