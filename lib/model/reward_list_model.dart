// To parse this JSON data, do
//
//     final rewardListModel = rewardListModelFromJson(jsonString);

import 'dart:convert';

RewardListModel rewardListModelFromJson(String str) =>
    RewardListModel.fromJson(json.decode(str));

String rewardListModelToJson(RewardListModel data) =>
    json.encode(data.toJson());

class RewardListModel {
  final bool success;
  final String message;
  final List<Datum> data;

  RewardListModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RewardListModel.fromJson(Map<String, dynamic> json) =>
      RewardListModel(
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
  final int voucherId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Voucher voucher;

  Datum({
    required this.id,
    required this.userId,
    required this.voucherId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.voucher,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        voucherId: json["voucher_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        voucher: Voucher.fromJson(json["voucher"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "voucher_id": voucherId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "voucher": voucher.toJson(),
      };
}

class Voucher {
  final int id;
  final String name;
  final String price;
  final int discountAmount;
  final DateTime expiryDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  Voucher({
    required this.id,
    required this.name,
    required this.price,
    required this.discountAmount,
    required this.expiryDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        discountAmount: json["discount_amount"],
        expiryDate: DateTime.parse(json["expiry_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "discount_amount": discountAmount,
        "expiry_date":
            "${expiryDate.year.toString().padLeft(4, '0')}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
