// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

import 'package:test_tdd/features/login/domain/entities/user.dart';

UserModel loginModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String loginModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    this.data,
  });

  String status;
  UserInfoModel data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"] == null ? null : json["status"],
        data:
            json["data"] == null ? null : UserInfoModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : data.toJson(),
      };
}

class UserInfoModel extends User {
  UserInfoModel(
      {id,
      fullName,
      username,
      phone,
      profileImg,
      userScope,
      email,
      gender,
      birthday,
      emailVerifiedAt,
      phoneVerifiedAt,
      createdAt,
      tokenApi})
      : super(
            birthday: birthday,
            createdAt: createdAt,
            email: email,
            emailVerifiedAt: emailVerifiedAt,
            fullName: fullName,
            gender: gender,
            id: id,
            phone: phone,
            phoneVerifiedAt: phoneVerifiedAt,
            profileImg: profileImg,
            tokenApi: tokenApi,
            userScope: userScope,
            username: username);
  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        id: json["id"] == null ? null : json["id"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        username: json["username"] == null ? null : json["username"],
        phone: json["phone"] == null ? null : json["phone"],
        profileImg: json["profile_img"],
        userScope: json["user_scope"] == null ? null : json["user_scope"],
        email: json["email"],
        gender: json["gender"],
        birthday: json["birthday"],
        emailVerifiedAt: json["email_verified_at"],
        phoneVerifiedAt: json["phone_verified_at"],
        createdAt: json["created_at"],
        tokenApi: json["token_api"] == null ? null : json["token_api"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "full_name": fullName == null ? null : fullName,
        "username": username == null ? null : username,
        "phone": phone == null ? null : phone,
        "profile_img": profileImg,
        "user_scope": userScope == null ? null : userScope,
        "email": email,
        "gender": gender,
        "birthday": birthday,
        "email_verified_at": emailVerifiedAt,
        "phone_verified_at": phoneVerifiedAt,
        "created_at": createdAt,
        "token_api": tokenApi == null ? null : tokenApi,
      };
}
