import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
