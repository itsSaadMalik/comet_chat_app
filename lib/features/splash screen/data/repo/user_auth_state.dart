import 'package:comet_chat_app/features/splash%20screen/domain/repo/auth_state.dart';
import 'package:comet_chat_app/core/utils/extensions/log_extension.dart';
import 'package:gotrue/src/types/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserAuthStateImpl implements UserAuthStateRepo {
  final SupabaseClient supabaseClient;
  final SharedPreferences sharedPreferences;

  UserAuthStateImpl({
    required this.supabaseClient,
    required this.sharedPreferences,
  });
  @override
  Stream<User?> getAuthState() {
    return supabaseClient.auth.onAuthStateChange.map(
      (event) => event.session?.user,
    );
    // try {
    //   // final subs=supabaseClient.auth.onAuthStateChange.listen((event) => null,);
    // } catch (e) {
    //   e.log();

    // }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      return sharedPreferences.getBool('is_logged_in') ?? false;
    } catch (e) {
      e.log();
      return false;
    }
  }

  Future<bool> setLogin() async {
    try {
      return sharedPreferences.setBool('is_logged_in', true);
    } catch (e) {
      e.log();
      return false;
    }
  }
}
