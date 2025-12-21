import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_spa_garden_mobile/model/history_point_model.dart';
import 'package:royal_spa_garden_mobile/network/points_network.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';

part 'point_history_state.dart';
part 'point_history_cubit.freezed.dart';

class PointHistoryCubit extends Cubit<PointHistoryState> {
  PointHistoryCubit() : super(const PointHistoryState.initial());
  late String token;

  initial() async {
    emit(const PointHistoryState.loading());

    token = await TokenUtils.getToken() ?? '';

    if (token.isEmpty) {
      emit(const PointHistoryState.unauthorized());
      return;
    }

    final result = await PointsNetwork().historyPoints(token);

    result.fold(
      (l) {
        if (l.statusCode == 401) {
          emit(const PointHistoryState.unauthorized());
        } else {
          emit(const PointHistoryState.error());
        }
      },
      (r) {
        emit(PointHistoryState.loaded(r));
      },
    );
  }
}
