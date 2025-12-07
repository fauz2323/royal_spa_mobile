import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_spa_garden_mobile/dto/auth_dto.dart';
import 'package:royal_spa_garden_mobile/model/register_model.dart';
import 'package:royal_spa_garden_mobile/network/auth_network.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState.initial());
  final AuthNetwork _authNetwork = AuthNetwork();

  Future<String?> registerUser({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(const RegisterState.loading());
    try {
      emit(const RegisterState.loading());
      // Simulate network call
      final result = await _authNetwork.registerUser(
        RegisterDto(
          name: username,
          email: email,
          password: password,
          phone: phone,
        ),
      );
      return result.fold<String>((l) {
        emit(const RegisterState.initial());
        return 'Registration failed: ${l.toString()}';
      }, (r) {
        emit(RegisterState.success(r));
        return 'Registration successful';
      });
    } catch (e) {
      emit(RegisterState.failure(Exception('Registration failed')));
      return 'Registration failed';
    }
  }
}
