import 'dart:convert';

UserDbModel userFromMap(String str) => UserDbModel.fromMap(json.decode(str));

String userToMap(UserDbModel data) => json.encode(data.toMap());

class UserDbModel {
  UserDbModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.loggedIn,
  });

  int id;
  String name;
  String email;
  String phone;
  String password;
  int loggedIn;

  factory UserDbModel.fromMap(Map<String, dynamic> json) => UserDbModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        password: json["password"] == null ? null : json["password"],
        loggedIn: json["loggedIn"] == null ? null : json["loggedIn"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "password": password == null ? null : password,
        "loggedIn": loggedIn == null ? null : loggedIn,
      };
}
