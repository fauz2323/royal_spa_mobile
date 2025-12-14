// To parse this JSON data, do
//
//     final orderMakeModel = orderMakeModelFromJson(jsonString);

import 'dart:convert';

OrderMakeModel orderMakeModelFromJson(String str) =>
    OrderMakeModel.fromJson(json.decode(str));

String orderMakeModelToJson(OrderMakeModel data) => json.encode(data.toJson());

class OrderMakeModel {
  final bool success;
  final String message;
  final Data data;

  OrderMakeModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory OrderMakeModel.fromJson(Map<String, dynamic> json) => OrderMakeModel(
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
  final int userId;
  final String spaServicesId;
  final int price;
  final String timeService;
  final String dateService;
  final String notes;
  final String status;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;
  final SpaService spaService;
  final User user;

  Data({
    required this.userId,
    required this.spaServicesId,
    required this.price,
    required this.timeService,
    required this.dateService,
    required this.notes,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.spaService,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        spaServicesId: json["spa_services_id"],
        price: json["price"],
        timeService: json["time_service"],
        dateService: json["date_service"],
        notes: json["notes"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        spaService: SpaService.fromJson(json["spa_service"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "spa_services_id": spaServicesId,
        "price": price,
        "time_service": timeService,
        "date_service": dateService,
        "notes": notes,
        "status": status,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "spa_service": spaService.toJson(),
        "user": user.toJson(),
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
