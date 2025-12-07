part of 'service_detail_cubit.dart';

@freezed
class ServiceDetailState with _$ServiceDetailState {
  const factory ServiceDetailState.initial() = _Initial;
  const factory ServiceDetailState.loading() = _Loading;
  const factory ServiceDetailState.loaded(
      ServiceSpaDetailModel data, DateTime? selectedDate) = _Loaded;
  const factory ServiceDetailState.error(String message) = _Error;
  const factory ServiceDetailState.unauthorized() = _Unauthorized;
}
