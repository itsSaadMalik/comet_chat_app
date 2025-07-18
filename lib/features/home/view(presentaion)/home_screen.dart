import 'package:comet_chat_app/features/conversations/conversation_screen.dart';
import 'package:comet_chat_app/utils/services/initialize_comet_chat.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    initializeCometChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CometChatMessageHeader(group: Group(guid: guid, name: name, type: type),),
      body: FutureBuilder(
        future: initializeCometChat(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return CometChatConversations(
              onItemTap: (conversation) => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ConversationScreen(
                    user: conversation.conversationWith is User
                        ? conversation.conversationWith as User
                        : null,
                    group: conversation.conversationWith is Group
                        ? conversation.conversationWith as Group
                        : null,
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
