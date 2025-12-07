// To parse this JSON data, do
//
//     final serviceSpaDetailModel = serviceSpaDetailModelFromJson(jsonString);

import 'dart:convert';

ServiceSpaDetailModel serviceSpaDetailModelFromJson(String str) =>
    ServiceSpaDetailModel.fromJson(json.decode(str));

String serviceSpaDetailModelToJson(ServiceSpaDetailModel data) =>
    json.encode(data.toJson());

class ServiceSpaDetailModel {
  final bool success;
  final Data data;

  ServiceSpaDetailModel({
    required this.success,
    required this.data,
  });

  factory ServiceSpaDetailModel.fromJson(Map<String, dynamic> json) =>
      ServiceSpaDetailModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
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

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
