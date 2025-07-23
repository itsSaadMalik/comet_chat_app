import 'dart:convert';

import 'package:comet_chat_app/core/enums/user_model_enums.dart';
import 'package:comet_chat_app/core/enums/user_type_enums.dart';
import 'package:comet_chat_app/core/helpers/fieldnames/user_model_fieldnames.dart';
import 'package:comet_chat_app/core/helpers/fieldnames/user_type_fieldnames.dart';
import 'package:comet_chat_app/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.username,
    required super.email,
    required super.uid,
    required super.usertype,
    required super.profilePictureURL,
    required super.createdAt,
  });

  UserModel copyWith({
    String? username,
    String? email,

    UserTypeEnums? usertype,
    String? profilePictureURL,
    DateTime? createdAt,
  }) => UserModel(
    uid: uid,
    username: username ?? this.username,
    email: email ?? this.email,
    usertype: usertype ?? this.usertype,
    profilePictureURL: profilePictureURL ?? this.profilePictureURL,
    createdAt: createdAt ?? this.createdAt,
  );
  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
    username: data[UserModelEnums.username.fieldname] ?? '',
    email: data[UserModelEnums.email.fieldname] ?? '',
    uid: (data[UserModelEnums.uid.fieldname]) ?? '',
    usertype: UserTypeFromString(
      data[UserModelEnums.usertype.fieldname],
    ).fieldname,
    profilePictureURL: data[UserModelEnums.profilePictureURL.fieldname] ?? '',
    createdAt: (data[UserModelEnums.createdAt.fieldname] != null)
        ? DateTime.parse(data[UserModelEnums.createdAt.fieldname])
        : DateTime.now(),
  );

  Map<String, dynamic> toMap() => {
    UserModelEnums.username.fieldname: username,
    UserModelEnums.email.fieldname: email,
    UserModelEnums.uid.fieldname: uid,
    UserModelEnums.usertype.fieldname: usertype.name,
    UserModelEnums.profilePictureURL.fieldname: profilePictureURL,
    UserModelEnums.createdAt.fieldname: createdAt.toString(),
  };

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  String get toJson => json.encode(toMap());
  @override
  bool operator ==(covariant UserModel other) => uid == other.uid;

  @override
  int get hashCode => uid.hashCode;
}
