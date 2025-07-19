import 'package:comet_chat_app/features/splash%20screen/presentation/provider/auth_state_stream_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthStateNotifier extends ChangeNotifier {
  final Ref ref;

  late ProviderSubscription<AsyncValue<User?>> subscription;
  AuthStateNotifier({required this.ref}) {
    subscription = ref.listen<AsyncValue<User?>>(authStateStreamProvider, (
      previous,
      next,
    ) {
      if (!next.isLoading && previous?.value != next.value) {
        notifyListeners();
      }
    });
  }
  User? get curenntUser => ref.read(authStateStreamProvider).value;
  @override
  void dispose() {
    subscription.close();
    super.dispose();
  }
}

final authStateProvider = Provider((ref) {
  ref.onDispose(() => 'authStateProvider disposed');
  return AuthStateNotifier(ref: ref);
});
