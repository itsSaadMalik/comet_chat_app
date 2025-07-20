import 'package:comet_chat_app/core/helpers/models/operation_results_model.dart';
import 'package:comet_chat_app/features/auth/data/data%20src/remote_user_datasrc_impl.dart';
import 'package:comet_chat_app/features/auth/data/model/user_model.dart';
import 'package:comet_chat_app/features/auth/domain/repo/user_repo.dart';

class UserRepositoryImpl implements UserRepo {
  final RemoteUserDatasrcImpl remoteUserDatasrcImpl;

  UserRepositoryImpl({required this.remoteUserDatasrcImpl});

  @override
  Future<OperationResults> createUser({required UserModel user}) async =>
      remoteUserDatasrcImpl.createUser(user: user);

  @override
  Future<UserModel?> fetchUserData({required String uid}) async =>
      remoteUserDatasrcImpl.fetchUserData(uid: uid);

  @override
  Future<OperationResults> updateUserData({required UserModel user}) async =>
      remoteUserDatasrcImpl.updateUserData(user: user);
}
