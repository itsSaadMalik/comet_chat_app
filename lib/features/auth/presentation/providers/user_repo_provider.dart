import 'package:comet_chat_app/features/auth/application/providers/data%20source/remote_user_datasrc.dart';
import 'package:comet_chat_app/features/auth/data/repo/user_repo_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepoProvider = Provider<UserRepositoryImpl>((ref) {
  final remoteDataSrc = ref.read(remoteUserDataSrcProvider);
  return UserRepositoryImpl(remoteUserDatasrcImpl: remoteDataSrc);
});
