import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_spa_garden_mobile/model/list_mission_model.dart';
import 'package:royal_spa_garden_mobile/model/network_model.dart';
import 'package:royal_spa_garden_mobile/model/profile_model.dart';
import 'package:royal_spa_garden_mobile/network/auth_network.dart';
import 'package:royal_spa_garden_mobile/network/mission_network.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';

part 'home_screen_state.dart';
part 'home_screen_cubit.freezed.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(const HomeScreenState.loading());
  late String token;
  String email = '-';
  initial() async {
    emit(const HomeScreenState.loading());
    try {
      token = await TokenUtils.getToken() ?? '';
      if (token.isEmpty) {
        emit(const HomeScreenState.unauthorized());
        return;
      }
      final request = await Future.wait([
        AuthNetwork().profile(token),
        MissionNetwork().getMission(token),
      ]);

      final profileResult = request[0] as Either<NetworkModel, ProfileModel>;
      final missionResult =
          request[1] as Either<NetworkModel, ListMissionModel>;

      profileResult.fold((networkError) {
        if (networkError.statusCode == 401) {
          emit(const HomeScreenState.unauthorized());
        } else {
          emit(HomeScreenState.error(message: networkError.message));
        }
      }, (profileData) {
        missionResult.fold((networkError) {
          if (networkError.statusCode == 401) {
            emit(const HomeScreenState.unauthorized());
          } else {
            emit(HomeScreenState.error(message: networkError.message));
          }
        }, (missionData) {
          emit(HomeScreenState.loaded(profileData, missionData));
        });
      });
    } catch (e) {
      emit(HomeScreenState.error(message: e.toString()));
    }
  }
}
