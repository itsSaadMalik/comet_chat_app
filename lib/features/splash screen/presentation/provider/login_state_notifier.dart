import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginStateNotifier extends StateNotifier<bool> {
  final SharedPreferences pref;
  LoginStateNotifier(this.pref) : super(false) {}
}

// class LoginStateNotifier extends StateNotifier<AsyncValue<bool>> {
//   final SharedPreferences pref;
//   LoginStateNotifier(this.pref) : super(AsyncValue.loading()) {
//     state = pref.getBool(key);
//   }
// }
