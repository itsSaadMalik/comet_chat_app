import 'package:comet_chat_app/configs/route%20configs/route_names.dart';
import 'package:comet_chat_app/features/auth/presentation/screens/login.dart';
import 'package:comet_chat_app/features/splash%20screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteConfigs {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage(child: SplashScreen()),
        name: RouteNames.home,
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => MaterialPage(child: LoginScreen()),
      ),
    ],
  );
}
