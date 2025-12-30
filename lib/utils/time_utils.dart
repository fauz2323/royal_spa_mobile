import 'package:flutter/material.dart';

extension TimeOfDayExtensions on TimeOfDay {
  String to24HourString() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}
