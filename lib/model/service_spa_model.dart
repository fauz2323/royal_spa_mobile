// To parse this JSON data, do
//
//     final serviceSpaModel = serviceSpaModelFromJson(jsonString);

import 'dart:convert';

ServiceSpaModel serviceSpaModelFromJson(String str) =>
    ServiceSpaModel.fromJson(json.decode(str));

String serviceSpaModelToJson(ServiceSpaModel data) =>
    json.encode(data.toJson());

class ServiceSpaModel {
  final bool success;
  final List<SpaService> data;

  ServiceSpaModel({
    required this.success,
    required this.data,
  });

  factory ServiceSpaModel.fromJson(Map<String, dynamic> json) =>
      ServiceSpaModel(
        success: json["success"],
        data: List<SpaService>.from(json["data"].map((x) => SpaService.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SpaService {
  final int id;
  final String uuid;
  final String name;
  final String description;
  final String price;
  final int duration;
  final bool isActive;
  final String image;
  final String points;
  final DateTime createdAt;
  final DateTime updatedAt;

  SpaService({
    required this.id,
    required this.uuid,
    required this.name,
    required this.description,
    required this.price,
    required this.duration,
    required this.isActive,
    required this.image,
    required this.points,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SpaService.fromJson(Map<String, dynamic> json) => SpaService(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        duration: json["duration"],
        isActive: json["is_active"],
        image: json["image"],
        points: json["points"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "description": description,
        "price": price,
        "duration": duration,
        "is_active": isActive,
        "image": image,
        "points": points,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
