// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  final bool success;
  final String message;
  final Data data;

  RegisterModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final User user;
  final Point point;
  final String token;

  Data({
    required this.user,
    required this.point,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        point: Point.fromJson(json["point"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "point": point.toJson(),
        "token": token,
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
  final String name;
  final String email;
  final String phone;
  final String role;
  final DateTime createdAt;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "role": role,
        "created_at": createdAt.toIso8601String(),
      };
}
