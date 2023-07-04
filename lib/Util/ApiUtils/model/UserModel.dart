// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String fullName;
  String phone;
  String email;
  String password;
  int areaId;
  int cityId;
  int regionId;

  User({
    required this.fullName,
    required this.phone,
    required this.email,
    required this.password,
    required this.areaId,
    required this.cityId,
    required this.regionId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["full_name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        areaId: json["area_id"],
        cityId: json["city_id"],
        regionId: json["region_id"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "phone": phone,
        "email": email,
        "password": password,
        "area_id": areaId,
        "city_id": cityId,
        "region_id": regionId,
      };
}
