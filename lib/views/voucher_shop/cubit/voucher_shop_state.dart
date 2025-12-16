part of 'voucher_shop_cubit.dart';

@freezed
class VoucherShopState with _$VoucherShopState {
  const factory VoucherShopState.initial() = _Initial;
  const factory VoucherShopState.loading() = _Loading;
  const factory VoucherShopState.success(String message) = _Success;
  const factory VoucherShopState.loaded(
      VoucherShopListModel data, ProfileModel profile) = _Loaded;
  const factory VoucherShopState.error(String? message) = _Error;
  const factory VoucherShopState.unauthorized() = _Unauthorized;
}
