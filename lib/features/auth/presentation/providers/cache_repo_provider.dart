import 'package:comet_chat_app/features/auth/application/providers/data%20source/local_user_datasrc.dart';
import 'package:comet_chat_app/features/auth/data/repo/cache_user__repo_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cacheRepoProvider = Provider<CacheUserRepoImpl>((ref) {
  final localDatasrc = ref.read(localDataSrcProvider);
  return CacheUserRepoImpl(localDatasrcImpl: localDatasrc);
});
