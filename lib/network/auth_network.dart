import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:royal_spa_garden_mobile/dto/auth_dto.dart';
import 'package:royal_spa_garden_mobile/model/login_model.dart';
import 'package:royal_spa_garden_mobile/model/network_model.dart';
import 'package:royal_spa_garden_mobile/model/profile_model.dart';
import 'package:royal_spa_garden_mobile/model/register_model.dart';

class AuthNetwork {
  Future<Either<NetworkModel, RegisterModel>> registerUser(
      RegisterDto registerDto) async {
    Map body = {
      'name': registerDto.name,
      'password': registerDto.password,
      'email': registerDto.email,
      'phone': registerDto.phone,
    };

    final response = await http.post(
      Uri.parse('https://rizky-firman.com/api/register'),
      body: body,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'accept': 'application/json',
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final jsonData = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final registerModel = RegisterModel.fromJson(jsonData);
      return Right(registerModel);
    }
    return Left(
      NetworkModel(
          statusCode: response.statusCode,
          message: jsonData['message'] ?? 'Registration failed'),
    );
  }

  Future<Either<NetworkModel, LoginModel>> loginUser(LoginDto loginDto) async {
    Map body = {
      'email': loginDto.email,
      'password': loginDto.password,
    };

    final response = await http.post(
      Uri.parse('https://rizky-firman.com/api/login'),
      body: body,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'accept': 'application/json',
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final jsonData = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final loginModel = LoginModel.fromJson(jsonData);
      return Right(loginModel);
    }
    return Left(
      NetworkModel(
          statusCode: response.statusCode,
          message: jsonData['message'] ?? 'Login failed'),
    );
  }

  Future<Either<NetworkModel, ProfileModel>> profile(String token) async {
    final response = await http.get(
      Uri.parse('https://rizky-firman.com/api/profile'),
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
      final profileModel = ProfileModel.fromJson(jsonData);
      return Right(profileModel);
    }
    return Left(
      NetworkModel(
          statusCode: response.statusCode,
          message: jsonData['message'] ?? 'Failed to fetch profile'),
    );
  }
}
