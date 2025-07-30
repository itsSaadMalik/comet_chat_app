import 'dart:async';

import 'package:comet_chat_app/configs/comet_chat_configs.dart';
import 'package:comet_chat_app/core/enums/auth_status.dart';
import 'package:comet_chat_app/core/enums/operation_results_enums.dart';
import 'package:comet_chat_app/core/enums/user_type_enums.dart';
import 'package:comet_chat_app/core/helpers/models/operation_results_model.dart';
import 'package:comet_chat_app/features/auth/data/model/auth_results.dart';
import 'package:comet_chat_app/features/auth/data/model/user_model.dart';
import 'package:comet_chat_app/features/auth/data/repo/user_repo_impl.dart';
import 'package:comet_chat_app/features/auth/domain/data%20src/auth_datasrc.dart';
import 'package:comet_chat_app/features/auth/domain/entity/auth_credentials_base.dart';
import 'package:comet_chat_app/core/utils/extensions/log_extension.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart' as cometchat;
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleAuthsource implements AuthDatasrc {
  final SupabaseClient supabaseClient;
  final UserRepositoryImpl userRepositoryImpl;

  GoogleAuthsource({
    required this.supabaseClient,
    required this.userRepositoryImpl,
  });

  @override
  Future<AuthResults> signIn({
    required AuthCredentialsBase authCredentials,
  }) async {
    try {
      // Completer halts the program and lets the async task complete before returning the results
      final completer = Completer<AuthResults>();
      final subscription = supabaseClient.auth.onAuthStateChange.listen((
        event,
      ) {
        final session = event.session;
        final user = event.session?.user;
        if (event.event == AuthChangeEvent.userUpdated ||
            event.event == AuthChangeEvent.signedIn) {
          event.log();
          final authresponse = AuthResponse(session: session, user: user);
          completer.complete(
            (session != null && user != null)
                ? AuthResults(
                    authStatus: AuthStatus.success,
                    message: 'Login successful',
                    authResponse: authresponse,
                  )
                : AuthResults(
                    authStatus: AuthStatus.failure,
                    message: 'Login failed',
                  ),
          );
        }
      });
      // 2. Trigger the OAuth flow
      final response = await supabaseClient.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: 'io.supabase.flutter://login-callback',
        authScreenLaunchMode: LaunchMode.platformDefault,
      );
      // 3. Wait for the event to complete
      final authResponse = await completer.future;

      await subscription.cancel();

      return authResponse;
    } catch (e) {
      e.log();
      return AuthResults(authStatus: AuthStatus.failure, message: e.toString());
    }
  }

  @override
  Future<OperationResults> signUp({required User user}) async {
    try {
      final uid = user.id;

      final email = user.email;
      final userMeta = user.userMetadata;

      final name = userMeta?['full_name'] ?? userMeta?['name'] ?? 'no name';
      final avatarUrl =
          userMeta?['avatar_url'] ?? userMeta?['picture'] ?? 'profile picture';

      final newCometChatUserResult = await cometchat.CometChat.createUser(
        cometchat.User(name: name),
        CometChatConfigs.auhtKey,
        onSuccess: (cometchat.User user) {},
        onError: (cometchat.CometChatException excep) {},
      );

      if (newCometChatUserResult == null) {
        'some mistake in creating cometChat userAccount'.log();
        return OperationResults(
          operationResultsStatus: OperationResultsEnums.failure,
          message: 'some mistake in creating cometChat userAccount',
        );
      }

      final newUser = UserModel(
        username: name != null ? name.toString() : 'no user name',
        email: email ?? 'na',
        uid: uid,
        usertype: UserTypeEnums.user,
        profilePictureURL: avatarUrl != null ? avatarUrl.toString() : '',
        createdAt: DateTime.parse(user.createdAt),
      );

      // create a new user in database
      final newuserCreation = await userRepositoryImpl.createUser(
        user: newUser,
      );
      return newuserCreation;
    } catch (e) {
      '$e'.log(startText: 'comet chat user creation error');

      return OperationResults(
        operationResultsStatus: OperationResultsEnums.failure,
        message: e.toString(),
      );
    }
  }

  @override
  Future<AuthResults> signOut() async {
    try {
      await supabaseClient.auth.signOut();
      return AuthResults(
        authStatus: AuthStatus.success,
        message: 'Logout successful',
      );
    } catch (e) {
      e.log();
      return AuthResults(
        authStatus: AuthStatus.failure,
        message: 'logout failed',
      );
    }
  }

  @override
  Future<AuthResults> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }
}
