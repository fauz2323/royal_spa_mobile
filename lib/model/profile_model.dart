// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  final bool success;
  final Data data;

  ProfileModel({
    required this.success,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  final User user;
  final Point point;

  Data({
    required this.user,
    required this.point,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        point: Point.fromJson(json["point"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "point": point.toJson(),
      };
}

class Point {
  final int points;
  final String status;

  Point({
    required this.points,
    required this.status,
  });

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        points: json["points"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "points": points,
        "status": status,
      };
}

class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String role;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "role": role,
        "created_at": createdAt.toIso8601String(),
      };
}
