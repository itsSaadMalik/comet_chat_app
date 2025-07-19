import 'package:comet_chat_app/configs/route%20configs/route_names.dart';
import 'package:comet_chat_app/core/shared/widgets/error_page.dart';
import 'package:comet_chat_app/features/auth/presentation/screens/login.dart';
import 'package:comet_chat_app/features/home/view(presentaion)/home_screen.dart';
import 'package:comet_chat_app/features/splash%20screen/presentation/provider/login_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: Center(child: CircularProgressIndicator(color: Colors.grey)),
    );
    // return loginState.when(
    //   data: (isloggedin) => isloggedin ? HomeScreen() : LoginScreen(),
    //   error: (error, stackTrace) => ErrorPage(),
    //   loading: () =>
    // );
  }
}
