// To parse this JSON data, do
//
//     final leaderboardsModel = leaderboardsModelFromJson(jsonString);

import 'dart:convert';

LeaderboardsModel leaderboardsModelFromJson(String str) =>
    LeaderboardsModel.fromJson(json.decode(str));

String leaderboardsModelToJson(LeaderboardsModel data) =>
    json.encode(data.toJson());

class LeaderboardsModel {
  final bool success;
  final String message;
  final List<Datum> data;

  LeaderboardsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LeaderboardsModel.fromJson(Map<String, dynamic> json) =>
      LeaderboardsModel(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;
  final int userId;
  final int points;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  Datum({
    required this.id,
    required this.userId,
    required this.points,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        points: json["points"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "points": points,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class User {
  final int id;
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final String phone;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.phone,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phone: json["phone"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "role": role,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
