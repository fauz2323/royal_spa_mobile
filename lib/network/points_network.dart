import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:royal_spa_garden_mobile/model/leaderboard_model.dart';
import 'package:royal_spa_garden_mobile/model/network_model.dart';
import 'package:http/http.dart' as http;
import 'package:royal_spa_garden_mobile/model/reedem_model.dart';
import 'package:royal_spa_garden_mobile/model/reward_list_model.dart';
import 'package:royal_spa_garden_mobile/model/voucher_list_model.dart';

class PointsNetwork {
  Future<Either<NetworkModel, LeaderboardsModel>> leaderboard(
      String token) async {
    final response = await http.get(
      Uri.parse('https://rizky-firman.com/api/customer/points/leaderboards'),
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
      final leaderboardModel = LeaderboardsModel.fromJson(jsonData);
      return Right(leaderboardModel);
    }
    return Left(
      NetworkModel(
          statusCode: response.statusCode,
          message: jsonData['message'] ?? 'Failed to fetch leaderboard'),
    );
  }

  Future<Either<NetworkModel, VoucherShopListModel>> getVoucherShop(
      String token) async {
    final response = await http.get(
      Uri.parse('https://rizky-firman.com/api/customer/points/voucher-shop'),
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
      final voucherShopListModel = VoucherShopListModel.fromJson(jsonData);
      return Right(voucherShopListModel);
    }
    return Left(
      NetworkModel(
          statusCode: response.statusCode,
          message: jsonData['message'] ?? 'Failed to fetch voucher shop'),
    );
  }

  Future<Either<NetworkModel, ReedemModel>> reedemVoucher(
      String token, String id) async {
    Map body = {
      'voucher_id': id,
    };

    final response = await http.post(
      Uri.parse('https://rizky-firman.com/api/customer/points/redeem-voucher'),
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
      final ReedemModel reedemModel = ReedemModel(
        statucCode: response.statusCode,
        message: jsonData['message'] ?? 'Voucher redeemed successfully',
      );
      return Right(reedemModel);
    }
    return Left(
      NetworkModel(
          statusCode: response.statusCode,
          message: jsonData['message'] ?? 'Failed to redeem voucher'),
    );
  }

  Future<Either<NetworkModel, RewardListModel>> reward(
    String token,
  ) async {
    final response = await http.get(
      Uri.parse('https://rizky-firman.com/api/customer/points/reward'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final jsonData = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final rewardListModel = RewardListModel.fromJson(jsonData);
      return Right(rewardListModel);
    }
    return Left(
      NetworkModel(
          statusCode: response.statusCode,
          message: jsonData['message'] ?? 'Failed to redeem voucher'),
    );
  }
}
