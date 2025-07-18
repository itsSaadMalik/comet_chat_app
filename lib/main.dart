import 'package:comet_chat_app/DI/shared_preferences_injection.dart';
import 'package:comet_chat_app/configs/route%20configs/route_configs.dart';
import 'package:comet_chat_app/core/themes/app_theme.dart';
import 'package:comet_chat_app/features/home/view(presentaion)/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://wqasuypzatqaahvtdppv.supabase.co';
const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  final pref = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [sharedPreferenceProvider.overrideWithValue(pref)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MediaQuery.of(context).platformBrightness == Brightness.light
          ? AppTheme.appLightTheme
          : AppTheme.appDarkTheme,
      routerConfig: RouteConfigs().router,
    );
  }

  // void inti() {
  //   UIKitSettings uiKitSettings =
  //       (UIKitSettingsBuilder()
  //             ..appId = CometChatConfigs.appID
  //             ..authKey = CometChatConfigs.auhtKey
  //             ..region = CometChatConfigs.region
  //             ..subscriptionType = CometChatSubscriptionType.allUsers
  //             ..autoEstablishSocketConnection = true
  //             ..extensions =
  //                 CometChatUIKitChatExtensions.getDefaultExtensions() //Replace this with empty array, if you want to disable all extensions
  //             ..callingExtension =
  //                 CometChatCallingExtension(
  //                   configuration: CallingConfiguration(),
  //                 ) //Optional: Include if you're using Audio/Video Calling
  //                 )
  //           .build();
  //   CometChatUIKit.init(
  //     uiKitSettings: uiKitSettings,
  //     onSuccess: (successMessage) => successMessage.log(),
  //   );
  // }
}
