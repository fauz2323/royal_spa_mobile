import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_spa_garden_mobile/model/reward_list_model.dart';
import 'package:royal_spa_garden_mobile/network/points_network.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';

part 'reward_state.dart';
part 'reward_cubit.freezed.dart';

class RewardCubit extends Cubit<RewardState> {
  RewardCubit() : super(const RewardState.initial());
  late String token;

  initial() async {
    emit(const RewardState.loading());
    token = await TokenUtils.getToken() ?? '';
    try {
      final rewards = await PointsNetwork().reward(token);
      rewards.fold((l) {
        if (l.statusCode == 401) {
          emit(const RewardState.unauthorized());
        } else {
          emit(RewardState.error(l.message ?? 'Unknown error'));
        }
      }, (r) {
        emit(RewardState.loaded(r));
      });
    } catch (e) {
      if (e.toString().contains('401')) {
        emit(const RewardState.unauthorized());
      } else {
        emit(RewardState.error(e.toString()));
      }
    }
  }
}
