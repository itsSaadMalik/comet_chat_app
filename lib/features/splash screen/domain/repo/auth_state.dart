import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserAuthStateRepo {
  Future<bool> isLoggedIn();
  Stream<AuthState> getAuthState();
}
