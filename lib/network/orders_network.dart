import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:royal_spa_garden_mobile/model/history_model.dart';
import 'package:royal_spa_garden_mobile/model/network_model.dart';
import 'package:http/http.dart' as http;
import 'package:royal_spa_garden_mobile/model/order_detail_model.dart';
import 'package:royal_spa_garden_mobile/model/order_make_model.dart';

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

  Future<Either<NetworkModel, OrderDetailModel>> historyDetail(
      String token, String id) async {
    Map body = {
      'id': id,
    };

    final response = await http.post(
      Uri.parse('https://rumah.nurfauzan.site/api/customer/orders/view'),
      body: body,
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
      final orderDetailModel = OrderDetailModel.fromJson(jsonData);
      return Right(orderDetailModel);
    }
    return Left(
      NetworkModel(
          statusCode: response.statusCode,
          message: jsonData['message'] ?? 'Failed to fetch history'),
    );
  }

  Future<Either<NetworkModel, OrderMakeModel>> orderMake(String token,
      String id, String timeService, String dateService, String notes) async {
    Map body = {
      'spa_services_id': id,
      'time_service': timeService,
      'date_service': dateService,
      'notes': notes,
    };

    final response = await http.post(
      Uri.parse('https://rumah.nurfauzan.site/api/customer/orders/make'),
      body: body,
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
      final orderMakeModel = OrderMakeModel.fromJson(jsonData);
      return Right(orderMakeModel);
    }
    return Left(
      NetworkModel(
          statusCode: response.statusCode,
          message: jsonData['message'] ?? 'Failed to make order'),
    );
  }
}
