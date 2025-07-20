import 'package:comet_chat_app/core/helpers/models/operation_results_model.dart';
import 'package:comet_chat_app/features/auth/data/model/user_model.dart';

abstract class RemoteUserDatasrc {
  Future<UserModel?> fetchUserData({required String uid});
  Future<OperationResults> updateUserData({required UserModel user});
  Future<OperationResults> createUser({required UserModel user});
}
