import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllUserScreens extends ConsumerWidget {
  const AllUserScreens({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CometChatUsers(onItemTap: (context, p1) => p1);
  }
}
