part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.success(RegisterModel registerModel) = _Success;
  const factory RegisterState.failure(Exception exception) = _Failure;
}
