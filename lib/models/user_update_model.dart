import 'dart:convert';

UserUpdateModel userUpdateModelFromJson(String str) => UserUpdateModel.fromJson(json.decode(str));

class UserUpdateModel {
  UserUpdateModel({
    required this.name,
    required this.job,
    required this.updatedAt,
  });

  String name;
  String job;
  DateTime updatedAt;

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) => UserUpdateModel(
    name: json["name"],
    job: json["job"],
    updatedAt: DateTime.parse(json["updatedAt"]),
  );


}
