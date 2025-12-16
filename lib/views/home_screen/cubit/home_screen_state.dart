part of 'home_screen_cubit.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState.initial() = _Initial;
  const factory HomeScreenState.loading() = _Loading;
  const factory HomeScreenState.loaded(
      ProfileModel data, ListMissionModel missionData) = _Loaded;
  const factory HomeScreenState.error({String? message}) = _Error;
  const factory HomeScreenState.unauthorized() = _Unauthorized;
}
