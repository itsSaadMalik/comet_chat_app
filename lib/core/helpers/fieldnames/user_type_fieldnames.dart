import 'package:comet_chat_app/core/enums/user_type_enums.dart';

extension UserTypeFieldnames on UserTypeEnums {
  String get fieldname {
    switch (this) {
      case UserTypeEnums.user:
        return 'user';
      case UserTypeEnums.admin:
        return 'admin';
    }
  }
}

extension UserTypeFromString on String {
  UserTypeEnums get fieldname {
    switch (this) {
      case 'user':
        return UserTypeEnums.user;
      case 'admin':
        return UserTypeEnums.admin;
      default:
        throw UnimplementedError('no implementaion');
    }
  }
}
