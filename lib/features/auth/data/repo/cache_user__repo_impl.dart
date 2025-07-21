import 'package:comet_chat_app/features/auth/data/data%20src/local_datasrc_impl.dart';
import 'package:comet_chat_app/features/auth/data/model/user_model.dart';
import 'package:comet_chat_app/features/auth/domain/repo/cache_user.dart';

class CacheUserRepoImpl implements CacheUserRepo {
  final LocalDatasrcImpl localDatasrcImpl;

  CacheUserRepoImpl({required this.localDatasrcImpl});
  @override
  Future<bool> cacheUserData({required UserModel user}) async =>
      await localDatasrcImpl.cacheUserData(user: user);

  @override
  Future<bool> clearCache() async => await localDatasrcImpl.clearCache();

  @override
  Future<UserModel?> fetchCacheUserData() async =>
      await localDatasrcImpl.fetchCacheUserData();

  @override
  Future<bool> updateCachedUserData({required UserModel user}) async =>
      await localDatasrcImpl.updateCachedUserData(user: user);
}
