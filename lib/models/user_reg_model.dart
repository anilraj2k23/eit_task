import 'dart:convert';

UserRegisterModel userRegisterModelFromJson(String str) => UserRegisterModel.fromJson(json.decode(str));

class UserRegisterModel {
  UserRegisterModel({
    required this.id,
    required this.token,
  });

  int id;
  String token;

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) => UserRegisterModel(
    id: json["id"],
    token: json["token"],
  );

}
