part of 'services_cubit.dart';

@freezed
class ServicesState with _$ServicesState {
  const factory ServicesState.initial() = _Initial;
  const factory ServicesState.loading() = _Loading;
  const factory ServicesState.loaded(ServiceSpaModel data) = _Loaded;
  const factory ServicesState.error(String message) = _Error;
  const factory ServicesState.unauthorized() = _Unauthorized;
}
