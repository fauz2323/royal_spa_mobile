part of 'leaderboards_cubit.dart';

@freezed
class LeaderboardsState with _$LeaderboardsState {
  const factory LeaderboardsState.initial() = _Initial;
  const factory LeaderboardsState.loading() = _Loading;
  const factory LeaderboardsState.loaded(LeaderboardsModel data) = _Loaded;
  const factory LeaderboardsState.error({
    required String message,
  }) = _Error;
  const factory LeaderboardsState.unauthorize() = _Unauthorize;
}
