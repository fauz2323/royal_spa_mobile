import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_spa_garden_mobile/model/network_model.dart';
import 'package:royal_spa_garden_mobile/model/profile_model.dart';
import 'package:royal_spa_garden_mobile/model/voucher_list_model.dart';
import 'package:royal_spa_garden_mobile/network/auth_network.dart';
import 'package:royal_spa_garden_mobile/network/points_network.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';

part 'voucher_shop_state.dart';
part 'voucher_shop_cubit.freezed.dart';

class VoucherShopCubit extends Cubit<VoucherShopState> {
  VoucherShopCubit() : super(const VoucherShopState.loading());
  late String token;
  late VoucherShopListModel voucherShopListModel;
  late ProfileModel profileModel;

  initial() async {
    emit(const VoucherShopState.loading());
    try {
      token = await TokenUtils.getToken() ?? "";
      print('VoucherShopCubit Token: $token');
      final req = await Future.wait([
        PointsNetwork().getVoucherShop(token),
        AuthNetwork().profile(token),
      ]);

      final voucherResponse =
          req[0] as Either<NetworkModel, VoucherShopListModel>;
      final profileResponse = req[1] as Either<NetworkModel, ProfileModel>;

      voucherResponse.fold((l) {
        if (l.statusCode == 401) {
          emit(const VoucherShopState.unauthorized());
          return;
        }
        emit(VoucherShopState.error(l.message));
      }, (voucherData) {
        profileResponse.fold((l) {
          emit(VoucherShopState.error(l.message));
        }, (profileData) {
          profileModel = profileData;
          voucherShopListModel = voucherData;
          emit(VoucherShopState.loaded(voucherShopListModel, profileModel));
        });
      });
    } catch (e) {
      emit(VoucherShopState.error(e.toString()));
    }
  }

  Future<void> redeemVoucher(String voucherId) async {
    emit(const VoucherShopState.loading());
    try {
      final response = await PointsNetwork().reedemVoucher(token, voucherId);
      return response.fold((l) {
        if (l.statusCode == 401) {
          emit(const VoucherShopState.unauthorized());
          return;
        }
        if (l.statusCode == 400) {
          emit(const VoucherShopState.error(
              "Saldo poin tidak mencukupi untuk menukar voucher ini."));
          return;
        }
        emit(VoucherShopState.error(l.message));
      }, (r) {
        emit(VoucherShopState.success(r.message));
      });
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
