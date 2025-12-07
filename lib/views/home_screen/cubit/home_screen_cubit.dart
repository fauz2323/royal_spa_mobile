import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_spa_garden_mobile/model/profile_model.dart';
import 'package:royal_spa_garden_mobile/network/auth_network.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';

part 'home_screen_state.dart';
part 'home_screen_cubit.freezed.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(const HomeScreenState.loading());
  late String token;
  initial() async {
    emit(const HomeScreenState.loading());
    try {
      token = await TokenUtils.getToken() ?? '';
      if (token.isEmpty) {
        emit(const HomeScreenState.unauthorized());
        return;
      }
      final profileResult = await AuthNetwork().profile(token);

      return profileResult.fold(
        (exception) {
          if (exception.statusCode == 401) {
            emit(const HomeScreenState.unauthorized());
            return;
          }
          emit(HomeScreenState.error(message: exception.toString()));
          return;
        },
        (profileModel) {
          emit(HomeScreenState.loaded(profileModel));
          return;
        },
      );
    } catch (e) {
      emit(HomeScreenState.error(message: e.toString()));
    }
  }
}
