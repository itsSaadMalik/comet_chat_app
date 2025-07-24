import 'package:comet_chat_app/core/enums/auth_status.dart';
import 'package:comet_chat_app/core/utils/extensions/log_extension.dart';
import 'package:comet_chat_app/features/auth/application/services/auth_service.dart';
import 'package:comet_chat_app/features/auth/data/repo/cache_user__repo_impl.dart';

class LogoutUsecase {
  final AuthService authService;
  final CacheUserRepoImpl cacheUserRepoImpl;

  LogoutUsecase({required this.authService, required this.cacheUserRepoImpl});
  Future<bool> signOutUser() async {
    try {
      final result = await authService.signOutServcie();
      return result.authStatus == AuthStatus.success;
    } catch (e) {
      e.log();
      return false;
    }
  }

  Future<bool> clearCahce() async {
    try {
      final result = await cacheUserRepoImpl.clearCache();
      return result;
    } catch (e) {
      e.log();
      return false;
    }
  }

  Future<bool> logoutFlow() async {
    try {
      final signoutResult = await signOutUser();
      final clearCacheResults = await clearCahce();
      return signoutResult && clearCacheResults;
    } catch (e) {
      e.log();
      return false;
    }
  }
}
