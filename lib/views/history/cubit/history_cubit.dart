import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_spa_garden_mobile/model/history_model.dart';
import 'package:royal_spa_garden_mobile/network/orders_network.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';

part 'history_state.dart';
part 'history_cubit.freezed.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(const HistoryState.initial());
  late String? _token;

  initial() async {
    emit(const HistoryState.loading());
    _token = await TokenUtils.getToken();
    if (_token == null) {
      emit(const HistoryState.unauthorized());
      return;
    }

    try {
      final ordersNetwork = OrdersNetwork();
      final result = await ordersNetwork.history(_token!);
      result.fold(
        (networkError) {
          emit(HistoryState.error(networkError.message));
        },
        (historyModel) {
          emit(HistoryState.loaded(historyModel));
        },
      );
    } catch (e) {
      emit(HistoryState.error(e.toString()));
    }
  }
}
