// To parse this JSON data, do
//
//     final listMissionModel = listMissionModelFromJson(jsonString);

import 'dart:convert';

ListMissionModel listMissionModelFromJson(String str) =>
    ListMissionModel.fromJson(json.decode(str));

String listMissionModelToJson(ListMissionModel data) =>
    json.encode(data.toJson());

class ListMissionModel {
  final bool success;
  final String message;
  final List<Datum> data;

  ListMissionModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ListMissionModel.fromJson(Map<String, dynamic> json) =>
      ListMissionModel(
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
  final int missionId;
  final String status;
  final int progress;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Mission mission;

  Datum({
    required this.id,
    required this.userId,
    required this.missionId,
    required this.status,
    required this.progress,
    required this.createdAt,
    required this.updatedAt,
    required this.mission,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        missionId: json["mission_id"],
        status: json["status"],
        progress: json["progress"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        mission: Mission.fromJson(json["mission"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "mission_id": missionId,
        "status": status,
        "progress": progress,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "mission": mission.toJson(),
      };
}

class Mission {
  final int id;
  final String title;
  final String description;
  final String points;
  final int goal;
  final DateTime createdAt;
  final DateTime updatedAt;

  Mission({
    required this.id,
    required this.title,
    required this.description,
    required this.points,
    required this.goal,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Mission.fromJson(Map<String, dynamic> json) => Mission(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        points: json["points"],
        goal: json["goal"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "points": points,
        "goal": goal,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
