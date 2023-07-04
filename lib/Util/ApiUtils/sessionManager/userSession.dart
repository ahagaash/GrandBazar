// To parse this JSON data, do
//
//     final userSession = userSessionFromJson(jsonString);

import 'dart:convert';

UserSession userSessionFromJson(String str) =>
    UserSession.fromJson(json.decode(str));

String userSessionToJson(UserSession data) => json.encode(data.toJson());

class UserSession {
  Customer customer;
  String accessToken;
  String tokenType;

  UserSession({
    required this.customer,
    required this.accessToken,
    required this.tokenType,
  });

  factory UserSession.fromJson(Map<String, dynamic> json) => UserSession(
        customer: Customer.fromJson(json["customer"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "customer": customer.toJson(),
        "access_token": accessToken,
        "token_type": tokenType,
      };
}

class Customer {
  int id;
  String fullName;
  String phone;
  String email;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int cityId;
  int regionId;
  int areaId;
  dynamic mobileToken;
  dynamic image;
  List<dynamic> media;

  Customer({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.cityId,
    required this.regionId,
    required this.areaId,
    this.mobileToken,
    this.image,
    required this.media,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        fullName: json["full_name"],
        phone: json["phone"],
        email: json["email"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        cityId: json["city_id"],
        regionId: json["region_id"],
        areaId: json["area_id"],
        mobileToken: json["mobile_token"],
        image: json["image"],
        media: List<dynamic>.from(json["media"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "phone": phone,
        "email": email,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "city_id": cityId,
        "region_id": regionId,
        "area_id": areaId,
        "mobile_token": mobileToken,
        "image": image,
        "media": List<dynamic>.from(media.map((x) => x)),
      };
}
