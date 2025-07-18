import 'package:comet_chat_app/configs/comet_chat_configs.dart';
import 'package:comet_chat_app/utils/extensions/log_extension.dart';
import 'package:cometchat_calls_uikit/cometchat_calls_uikit.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

Future<bool> initializeCometChat() async {
  try {
    UIKitSettings uiKitSettings =
        (UIKitSettingsBuilder()
              ..appId = CometChatConfigs.appID
              ..authKey = CometChatConfigs.auhtKey
              ..region = CometChatConfigs.region
              ..subscriptionType = CometChatSubscriptionType.allUsers
              ..autoEstablishSocketConnection = true
              ..extensions =
                  CometChatUIKitChatExtensions.getDefaultExtensions() //Replace this with empty array, if you want to disable all extensions
              ..callingExtension =
                  CometChatCallingExtension(
                    configuration: CallingConfiguration(),
                  ) //Optional: Include if you're using Audio/Video Calling
                  )
            .build();
    CometChatUIKit.init(
      uiKitSettings: uiKitSettings,
      onSuccess: (successMessage) {
        successMessage.log();
        CometChat.login(
          'cometchat-uid-1',
          CometChatConfigs.auhtKey,
          onSuccess: (user) => user.uid.log(),
          onError: (excep) => excep.message?.log(),
        );
        return true;
      },
    );
    return false;
  } catch (e) {
    return false;
  }
}
