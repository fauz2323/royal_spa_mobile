import 'package:dartz/dartz.dart';
import 'package:royal_spa_garden_mobile/model/network_model.dart';
import 'package:royal_spa_garden_mobile/model/service_spa_detail_model.dart';
import 'package:royal_spa_garden_mobile/model/service_spa_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServiceSpaNetwork {
  Future<Either<NetworkModel, ServiceSpaModel>> getServices(
      String token) async {
    final response = await http.get(
      Uri.parse('https://rizky-firman.com/api/customer/services'),
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
      final serviceSpaModel = ServiceSpaModel.fromJson(jsonData);
      return Right(serviceSpaModel);
    }
    return Left(
      NetworkModel(
          statusCode: response.statusCode,
          message: jsonData['message'] ?? 'Unknown error'),
    );
  }

  Future<Either<NetworkModel, ServiceSpaDetailModel>> getServiceDetail(
      String token, String serviceId) async {
    print('Fetching details for service ID: $serviceId');
    final response = await http.get(
      Uri.parse(
          'https://rizky-firman.com/api/customer/services/$serviceId/detail'),
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
      final serviceSpaDetailModel = ServiceSpaDetailModel.fromJson(jsonData);
      return Right(serviceSpaDetailModel);
    }
    return Left(
      NetworkModel(
          statusCode: response.statusCode,
          message: jsonData['message'] ?? 'Unknown error'),
    );
  }
}
