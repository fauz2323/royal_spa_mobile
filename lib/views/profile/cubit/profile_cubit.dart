import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_spa_garden_mobile/model/profile_model.dart';
import 'package:royal_spa_garden_mobile/network/auth_network.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.initial());
  late String token;

  initial() async {
    emit(const ProfileState.loading());

    token = await TokenUtils.getToken() ?? '';

    if (token.isEmpty) {
      emit(const ProfileState.unauthorized());
      return;
    }

    try {
      final user = await AuthNetwork().profile(token);

      return user.fold((l) {
        if (l.statusCode == 401) {
          emit(const ProfileState.unauthorized());
        } else {
          emit(ProfileState.error(l.message));
        }
      }, (r) {
        emit(ProfileState.loaded(r));
      });
    } catch (e) {
      emit(ProfileState.error(e.toString()));
    }
  }

  Future<void> logout() async {
    await TokenUtils.deleteAllTokens();
  }
}
