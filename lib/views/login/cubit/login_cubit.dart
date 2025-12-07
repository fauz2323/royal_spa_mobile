import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_spa_garden_mobile/dto/auth_dto.dart';
import 'package:royal_spa_garden_mobile/model/login_model.dart';
import 'package:royal_spa_garden_mobile/network/auth_network.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());
  final AuthNetwork _authNetwork = AuthNetwork();

  Future<String> login(String email, String password) async {
    emit(const LoginState.loading());
    try {
      final req = await _authNetwork
          .loginUser(LoginDto(email: email, password: password));
      return req.fold<String>((l) {
        emit(const LoginState.initial());
        return 'Login failed: ${l.toString()}';
      }, (r) {
        emit(LoginState.success(r));
        return 'Login successful';
      });
    } catch (e) {
      emit(LoginState.failure(e.toString()));
      return 'An error occurred: ${e.toString()}';
    }
  }
}
