part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.authenticated() = _Authenticated;
  const factory SplashState.unauthenticated() = _Unauthenticated;
}
