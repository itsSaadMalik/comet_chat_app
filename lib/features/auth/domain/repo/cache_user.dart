import 'package:comet_chat_app/features/auth/data/model/user_model.dart';

abstract class CacheUserRepo {
  Future<bool> cacheUserData({required UserModel user});
  Future<UserModel?> fetchCacheUserData();
  Future<bool> clearCache();

  Future<bool> updateCachedUserData({required UserModel user});
}
