import 'package:comet_chat_app/core/helpers/models/operation_results_model.dart';
import 'package:comet_chat_app/features/auth/data/model/user_model.dart';
import 'package:comet_chat_app/features/auth/domain/data%20src/remote_user_datasrc.dart';
import 'package:comet_chat_app/utils/extensions/log_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteUserDatasrcImpl implements RemoteUserDatasrc {
  final Supabase supabase;

  RemoteUserDatasrcImpl({required this.supabase});

  @override
  Future<OperationResults> createUser({required String uid}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> fetchUserData({required String uid}) async {
    try {
      final userData = await supabase.client.from('users').select();
    } catch (e) {
      e.log();
      return null;
    }
  }

  @override
  Future<OperationResults> updateUserData({required String uid}) {
    // TODO: implement updateUserData
    throw UnimplementedError();
  }
}
