import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  UserModel({
    required this.data,
    required this.support,
  });

  Data data;
  Support support;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    data: Data.fromJson(json["data"]),
    support: Support.fromJson(json["support"]),
  );

  static   UserModel initialUserData = UserModel(
      data: Data(
          id: 0, email: '', firstName: "", lastName: '', avatar: ''),
      support: Support(url: '', text: ''));


}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

}

class Support {
  Support({
    required this.url,
    required this.text,
  });

  String url;
  String text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"],
    text: json["text"],
  );

}
