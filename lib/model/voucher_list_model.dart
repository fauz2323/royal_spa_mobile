// To parse this JSON data, do
//
//     final voucherShopListModel = voucherShopListModelFromJson(jsonString);

import 'dart:convert';

VoucherShopListModel voucherShopListModelFromJson(String str) =>
    VoucherShopListModel.fromJson(json.decode(str));

String voucherShopListModelToJson(VoucherShopListModel data) =>
    json.encode(data.toJson());

class VoucherShopListModel {
  final bool success;
  final String message;
  final List<Datum> data;

  VoucherShopListModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory VoucherShopListModel.fromJson(Map<String, dynamic> json) =>
      VoucherShopListModel(
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
  final String name;
  final String price;
  final int discountAmount;
  final DateTime expiryDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  Datum({
    required this.id,
    required this.name,
    required this.price,
    required this.discountAmount,
    required this.expiryDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
