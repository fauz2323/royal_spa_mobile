// To parse this JSON data, do
//
//     final historyPointModel = historyPointModelFromJson(jsonString);

import 'dart:convert';

HistoryPointModel historyPointModelFromJson(String str) =>
    HistoryPointModel.fromJson(json.decode(str));

String historyPointModelToJson(HistoryPointModel data) =>
    json.encode(data.toJson());

class HistoryPointModel {
  final bool success;
  final String message;
  final List<Datum> data;

  HistoryPointModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory HistoryPointModel.fromJson(Map<String, dynamic> json) =>
      HistoryPointModel(
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
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Datum({
    required this.id,
    required this.userId,
    required this.points,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        points: json["points"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "points": points,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
