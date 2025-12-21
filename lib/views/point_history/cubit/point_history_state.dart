part of 'point_history_cubit.dart';

@freezed
class PointHistoryState with _$PointHistoryState {
  const factory PointHistoryState.initial() = _Initial;
  const factory PointHistoryState.loading() = _Loading;
  const factory PointHistoryState.loaded(HistoryPointModel data) = _Loaded;
  const factory PointHistoryState.error() = _Error;
  const factory PointHistoryState.unauthorized() = _Unauthorized;
}
