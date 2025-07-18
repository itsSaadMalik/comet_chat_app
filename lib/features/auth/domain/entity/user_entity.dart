import 'package:comet_chat_app/core/enums/user_type_enums.dart';

class UserEntity {
  final String username;
  final String email;
  final String uid;
  final UserTypeEnums usertype;
  final String profilePictureURL;
  final DateTime createdAt;

  UserEntity({
    required this.username,
    required this.email,
    required this.uid,
    required this.usertype,
    required this.profilePictureURL,
    required this.createdAt,
  });
}
