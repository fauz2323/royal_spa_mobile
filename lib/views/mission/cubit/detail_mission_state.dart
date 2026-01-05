import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/list_mission_model.dart';
import '../../../model/service_spa_model.dart';

part 'detail_mission_state.freezed.dart';

@freezed
class DetailMissionState with _$DetailMissionState {
  const factory DetailMissionState.initial() = _Initial;
  const factory DetailMissionState.loading() = _Loading;
  const factory DetailMissionState.loaded({
    required Mission mission,
    required List<SpaService> services,
  }) = _Loaded;
  const factory DetailMissionState.error(String message) = _Error;
}