import 'package:comet_chat_app/core/enums/user_model_enums.dart';

extension UserModelFieldnames on UserModelEnums {
  String get fieldname {
    switch (this) {
      case UserModelEnums.username:
        return 'user_name';
      case UserModelEnums.email:
        return 'user_email';
      case UserModelEnums.uid:
        return 'uid';
      case UserModelEnums.usertype:
        return 'user_type';
      case UserModelEnums.profilePictureURL:
        return 'profile_picture_link';
      case UserModelEnums.createdAt:
        return 'created_at';
    }
  }
}

extension UserModelfieldFromFieldnames on String {
  UserModelEnums get fieldname {
    switch (this) {
      case 'user_name':
        return UserModelEnums.username;
      case 'user_email':
        return UserModelEnums.email;
      case 'uid':
        return UserModelEnums.uid;
      case 'user_type':
        return UserModelEnums.usertype;
      case 'profile_picture_url':
        return UserModelEnums.profilePictureURL;
      case 'created_at':
        return UserModelEnums.createdAt;
      default:
        throw UnimplementedError('no implementaion');
    }
  }
}
