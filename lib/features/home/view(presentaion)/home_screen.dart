import 'package:comet_chat_app/configs/route%20configs/route_names.dart';
import 'package:comet_chat_app/core/themes/edge_insets.dart';
import 'package:comet_chat_app/features/auth/application/providers/data%20source/google_auth_src_provider.dart';
import 'package:comet_chat_app/features/conversations/conversation_screen.dart';
import 'package:comet_chat_app/features/home/provider/init_cometchat.dart';
import 'package:comet_chat_app/features/home/view(presentaion)/error_screen.dart';
import 'package:comet_chat_app/features/home/view(presentaion)/loading_screen.dart';
import 'package:comet_chat_app/features/splash%20screen/presentation/provider/auth_state_stream_provider.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authStateStreamProvider);
    final oAuth = ref.read(googleAuthSrcProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(RouteNames.chatUsers);
        },
        child: Icon(Icons.chat, size: 25),
      ),
      body: user.when(
        data: (data) {
          if (data == null) {
            return Center(
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: const Color.fromARGB(255, 167, 167, 167),
                  ),
                  Text('please wait'),
                ],
              ),
            );
          } else {
            final initCometChat = ref.watch(
              initializeCometChatProvider(data.id),
            );

            return initCometChat.when(
              data: (data) => SingleChildScrollView(
                padding: standardEdgeInserts.copyWith(top: 0),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * .79,
                      child: CometChatConversations(
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
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // await Supabase.instance.client.auth.signOut();
                        await oAuth.signOut();
                      },
                      child: Text('sign out'),
                    ),
                  ],
                ),
              ),
              error: (error, stackTrace) => ErrorScreen(error: error as Error),
              loading: () => LoadingScreen(),
            );
          }
        },

        error: (error, stackTrace) =>
            ErrorScreen(error: error as Error, stackTrace: stackTrace),
        loading: () => LoadingScreen(),
      ),
    );
  }
}
