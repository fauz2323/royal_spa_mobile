import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_spa_garden_mobile/model/leaderboard_model.dart';
import 'package:royal_spa_garden_mobile/network/points_network.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';

part 'leaderboards_state.dart';
part 'leaderboards_cubit.freezed.dart';

class LeaderboardsCubit extends Cubit<LeaderboardsState> {
  LeaderboardsCubit() : super(const LeaderboardsState.initial());
  late String token;

  initial() async {
    emit(const LeaderboardsState.loading());
    try {
      // Simulate network call
      token = await TokenUtils.getToken() ?? '';
      if (token.isEmpty) {
        emit(const LeaderboardsState.unauthorize());
        return;
      }
      final req = await PointsNetwork().leaderboard(token);
      return req.fold((l) {
        if (l.statusCode == 401) {
          emit(const LeaderboardsState.unauthorize());
          return;
        } else {
          emit(LeaderboardsState.error(message: l.message ?? 'Unknown error'));
        }
      }, (r) {
        emit(LeaderboardsState.loaded(r));
      });
    } catch (e) {
      emit(LeaderboardsState.error(message: e.toString()));
    }
  }
}
