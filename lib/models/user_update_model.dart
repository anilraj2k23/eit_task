import 'dart:convert';

UserUpdateModel userUpdateModelFromJson(String str) => UserUpdateModel.fromJson(json.decode(str));

class UserUpdateModel {
  UserUpdateModel({
    required this.address,
    required this.job,
    required this.updatedAt,
  });

  String address;
  String job;
  DateTime updatedAt;

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) => UserUpdateModel(
    address: json["address"],
    job: json["job"],
    updatedAt: DateTime.parse(json["updatedAt"]),
  );


}
