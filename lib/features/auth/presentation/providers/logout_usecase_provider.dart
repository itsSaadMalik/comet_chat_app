import 'package:comet_chat_app/core/enums/auth_types.dart';
import 'package:comet_chat_app/features/auth/application/providers/auth_service_provider.dart';
import 'package:comet_chat_app/features/auth/domain/usecase/logout_usecase.dart';
import 'package:comet_chat_app/features/auth/presentation/providers/cache_repo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logoutUsecaseProvider = Provider<LogoutUsecase>((ref) {
  final authService = ref.read(authServiceProvider(AuthType.google));
  final cacheUserRepoImpl = ref.read(cacheRepoProvider);

  return LogoutUsecase(
    authService: authService,
    cacheUserRepoImpl: cacheUserRepoImpl,
  );
});
