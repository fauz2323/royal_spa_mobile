import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  Future<void> initial() async {
    emit(const SplashState.initial());
    await Future.delayed(const Duration(seconds: 2));
    final String? token = await TokenUtils.getToken();
    if (token == null) {
      emit(const SplashState.unauthenticated());
    } else {
      emit(const SplashState.authenticated());
    }
  }
}
