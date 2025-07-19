import 'package:comet_chat_app/core/themes/edge_insets.dart';
import 'package:comet_chat_app/features/auth/application/providers/email_authsrc_provider.dart';
import 'package:comet_chat_app/features/auth/application/providers/google_auth_src_provider.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20credentials/email_credentials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final emailAuth = ref.watch(emailAuthSourceProvider);
    final googleAuth = ref.watch(googleAuthSrcProvider);

    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          padding: standardEdgeInserts,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text('Login')],
          ),
        ),
      ),
    );
  }
}
