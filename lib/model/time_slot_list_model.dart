// To parse this JSON data, do
//
//     final timeSlotListModel = timeSlotListModelFromJson(jsonString);

import 'dart:convert';

TimeSlotListModel timeSlotListModelFromJson(String str) =>
    TimeSlotListModel.fromJson(json.decode(str));

String timeSlotListModelToJson(TimeSlotListModel data) =>
    json.encode(data.toJson());

class TimeSlotListModel {
  final bool success;
  final List<TimeSlot> data;

  TimeSlotListModel({
    required this.success,
    required this.data,
  });

  factory TimeSlotListModel.fromJson(Map<String, dynamic> json) =>
      TimeSlotListModel(
        success: json["success"],
        data: List<TimeSlot>.from(json["data"].map((x) => TimeSlot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TimeSlot {
  final String timeStart;
  final String timeEnd;
  final bool available;

  TimeSlot({
    required this.timeStart,
    required this.timeEnd,
    required this.available,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
    timeStart: json["time_start"],
    timeEnd: json["time_end"],
    available: json["available"],
  );

  Map<String, dynamic> toJson() => {
    "time_start": timeStart,
    "time_end": timeEnd,
    "available": available,
  };
}
