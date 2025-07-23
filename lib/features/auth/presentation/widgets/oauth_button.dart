import 'package:comet_chat_app/core/enums/auth_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OauthButton extends ConsumerWidget {
  const OauthButton({super.key, required this.onTap, required this.authType});
  final AuthType authType;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onTap,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        fixedSize: WidgetStatePropertyAll(
          Size(
            MediaQuery.sizeOf(context).width * .8,
            MediaQuery.sizeOf(context).height * .09,
          ),
        ),
      ),
      child: Row(
        spacing: 13,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('SignIn with ${authType.name}'),
          Image.asset(
            'assets/icon/${authType.name}.png',
            height: 23,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
