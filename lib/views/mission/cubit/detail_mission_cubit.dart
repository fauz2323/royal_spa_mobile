import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_spa_garden_mobile/model/list_mission_model.dart';

import '../../../network/service_spa_model.dart';
import '../../../utils/token_utils.dart';
import 'detail_mission_state.dart';

class DetailMissionCubit extends Cubit<DetailMissionState> {
  DetailMissionCubit(this.mission) : super(const DetailMissionState.initial());
  final Mission mission;
  final ServiceSpaNetwork serviceSpaNetwork = ServiceSpaNetwork();
  String token = '';

  Future<void> loadServices() async {
    emit(const DetailMissionState.loading());

    token = await TokenUtils.getToken() ?? '';

    try {
      final req = await ServiceSpaNetwork().getServicesByServiceId(
        token,
        mission.services,
      );

      req.fold(
        (l) {
          if (l.statusCode == 401) {
            emit(const DetailMissionState.error('UnAuthorized'));
          } else {
            emit(DetailMissionState.error(l.message));
          }
        },
        (r) =>
            emit(DetailMissionState.loaded(mission: mission, services: r.data)),
      );
    } catch (e) {
      emit(DetailMissionState.error(e.toString()));
    }
  }
}
