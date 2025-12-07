import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:royal_spa_garden_mobile/model/history_model.dart';
import 'package:royal_spa_garden_mobile/model/network_model.dart';
import 'package:http/http.dart' as http;

class OrdersNetwork {
  Future<Either<NetworkModel, HistoryModel>> history(String token) async {
    final response = await http.get(
      Uri.parse('https://rumah.nurfauzan.site/api/customer/orders'),
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
      final historyModel = HistoryModel.fromJson(jsonData);
      return Right(historyModel);
    }
    return Left(
      NetworkModel(
          statusCode: response.statusCode,
          message: jsonData['message'] ?? 'Failed to fetch history'),
    );
  }
}
