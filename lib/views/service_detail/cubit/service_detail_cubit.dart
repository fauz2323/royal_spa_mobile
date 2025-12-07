import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_spa_garden_mobile/model/service_spa_detail_model.dart';
import 'package:royal_spa_garden_mobile/model/service_spa_model.dart';
import 'package:royal_spa_garden_mobile/network/service_spa_model.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';

part 'service_detail_state.dart';
part 'service_detail_cubit.freezed.dart';

class ServiceDetailCubit extends Cubit<ServiceDetailState> {
  ServiceDetailCubit() : super(const ServiceDetailState.initial());
  late String token;
  late ServiceSpaDetailModel serviceDetail;
  DateTime? selectedDate;

  Future<void> initial(String uuid) async {
    emit(const ServiceDetailState.loading());
    // Simulate fetching data
    try {
      token = await TokenUtils.getToken() ?? '';

      final req = await ServiceSpaNetwork().getServiceDetail(token, uuid);
      return req.fold((l) {
        if (l == 401) {
          emit(const ServiceDetailState.unauthorized());
        } else {
          emit(ServiceDetailState.error(
              "Failed to fetch service detail. Error code: $l"));
        }
      }, (r) {
        serviceDetail = r;
        emit(ServiceDetailState.loaded(r, selectedDate));
      });
    } catch (e) {
      emit(ServiceDetailState.error(e.toString()));
    }
  }

  setDate(DateTime date) {
    selectedDate = date;
    emit(ServiceDetailState.loaded(serviceDetail, selectedDate));
  }
}
