part of 'reward_cubit.dart';

@freezed
class RewardState with _$RewardState {
  const factory RewardState.initial() = _Initial;
  const factory RewardState.loading() = _Loading;
  const factory RewardState.loaded(RewardListModel rewards) = _Loaded;
  const factory RewardState.error(String message) = _Error;
  const factory RewardState.unauthorized() = _Unauthorized;
}
