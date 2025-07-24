import 'package:comet_chat_app/configs/route%20configs/route_names.dart';
import 'package:comet_chat_app/features/auth/presentation/screens/login.dart';
import 'package:comet_chat_app/features/home/view(presentaion)/home_screen.dart';
import 'package:comet_chat_app/features/splash%20screen/presentation/provider/auth_state_notifier.dart';
import 'package:comet_chat_app/features/splash%20screen/presentation/provider/login_state_provider.dart';
import 'package:comet_chat_app/features/splash%20screen/presentation/screens/splash_screen.dart';
import 'package:comet_chat_app/core/utils/extensions/log_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routesProvider = Provider<GoRouter>((ref) {
  final authStateStream = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: RouteNames.splash,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashScreen(),
        name: RouteNames.splash,
      ),
      GoRoute(
        path: '/login',
        name: RouteNames.login,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        name: RouteNames.home,

        builder: (context, state) => HomeScreen(),
      ),
    ],
    refreshListenable: authStateStream,
    redirect: (context, state) async {
      final login = authStateStream.curenntUser;

      final isLoggedIn = login != null;

      final currentLocation = state.matchedLocation;

      final isOnLogin = currentLocation == RouteNames.login;
      final isOnSignUp = currentLocation == RouteNames.signUp;
      final isOnSplash = currentLocation == RouteNames.splash;

      final isOnpublicRoute = isOnLogin || isOnSignUp || isOnSplash;
      if (!isLoggedIn && !isOnpublicRoute) {
        return RouteNames.login;
      }
      if (((isLoggedIn)) && isOnpublicRoute) {
        '$isLoggedIn user logged in'.log();
        return RouteNames.home;
      }

      return null;
    },
  );
});

      // final loginState = ref.watch(loginStateProvider);
      // final login = authStateStream.curenntUser;
      // final isLoading = loginState.isLoading;
      // final isLoggedIn = loginState.value ?? false;

      // final currentLocation = state.matchedLocation;

      // final isOnLogin = currentLocation == RouteNames.login;
      // final isOnSignUp = currentLocation == RouteNames.signUp;

      // if (isLoading) {
      //   'message1'.log();

      //   return null;
      // }
      // if (((loginState.value ?? false)) &&
      //     !(state.matchedLocation == RouteNames.home)) {
      //   '${loginState.value} user logged in'.log();
      //   return RouteNames.home;
      // }
      // if (!(loginState.value ?? false) &&
      //     state.matchedLocation != RouteNames.login) {
      //   //print its logged in
      //   '${loginState.value} user not logged in'.log();

      //   return RouteNames.login;
      // }
      // return null;