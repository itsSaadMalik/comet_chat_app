import 'package:comet_chat_app/core/shared/widgets/error_page.dart';
import 'package:comet_chat_app/features/home/view(presentaion)/home_screen.dart';
import 'package:comet_chat_app/features/splash%20screen/presentation/provider/login_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(loginStateProvider);
    return isLoggedIn.when(
      data: (data) => HomeScreen(),
      error: (error, stackTrace) => ErrorPage(),
      loading: () =>
          Center(child: CircularProgressIndicator(color: Colors.grey)),
    );
  }
}
