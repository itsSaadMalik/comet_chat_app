import 'dart:developer';

import 'package:comet_chat_app/core/utils/extensions/log_extension.dart';
import 'package:cometchat_calls_uikit/cometchat_calls_uikit.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConversationScreen extends ConsumerWidget {
  const ConversationScreen({super.key, this.group, this.user});
  final Group? group;
  final User? user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    group?.guid?.log();
    user?.name.log();
    group?.type.log();
    return Scaffold(
      appBar: CometChatMessageHeader(
        group: Group(
          guid: group!.guid,
          name: group?.name ?? 'deafult',
          type: group!.type,
        ),
      ),
      body: Column(
        children: [
          Expanded(child: CometChatMessageList(group: group)),
          CometChatMessageComposer(user: user, group: group),
          // CometChatMessageInput(),
        ],
      ),
    );
  }
}
