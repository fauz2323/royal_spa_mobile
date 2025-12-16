import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:royal_spa_garden_mobile/model/list_mission_model.dart';
import 'package:royal_spa_garden_mobile/model/network_model.dart';
import 'package:http/http.dart' as http;

class MissionNetwork {
  Future<Either<NetworkModel, ListMissionModel>> getMission(
      String token) async {
    final response = await http.get(
      Uri.parse('https://rizky-firman.com/api/customer/mission/index'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final jsonData = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final missionModel = ListMissionModel.fromJson(jsonData);
      return Right(missionModel);
    }
    return Left(
      NetworkModel(
          statusCode: response.statusCode,
          message: jsonData['message'] ?? 'Failed to fetch missions'),
    );
  }
}
