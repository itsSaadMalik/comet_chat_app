import 'package:comet_chat_app/core/utils/extensions/log_extension.dart';
import 'package:comet_chat_app/features/auth/data/model/user_model.dart';
import 'package:comet_chat_app/features/auth/domain/data%20src/local_datasrc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatasrcImpl implements LocalDatasrc {
  final SharedPreferences sharedPreferences;

  LocalDatasrcImpl({required this.sharedPreferences});
  @override
  Future<bool> cacheUserData({required UserModel user}) async {
    try {
      return await sharedPreferences.setString('user', user.toJson);
    } catch (e) {
      e.log();
      return false;
    }
  }

  @override
  Future<bool> clearCache() async {
    try {
      return await sharedPreferences.clear();
    } catch (e) {
      e.log();
      return false;
    }
  }

  @override
  Future<bool> updateCachedUserData({required UserModel user}) {
    // TODO: implement updateCachedUserData
    throw UnimplementedError('no updation');
  }

  @override
  Future<UserModel?> fetchCacheUserData() async {
    try {
      final user = sharedPreferences.getString('user');
      if (user == null) return null;
      return UserModel.fromJson(user);
    } catch (e) {
      e.log();
      return null;
    }
  }
}
