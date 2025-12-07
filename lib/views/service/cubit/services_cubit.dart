import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_spa_garden_mobile/model/service_spa_model.dart';
import 'package:royal_spa_garden_mobile/network/service_spa_model.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';

part 'services_state.dart';
part 'services_cubit.freezed.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(const ServicesState.initial());
  late String token;

  Future<void> fetchServices() async {
    emit(const ServicesState.loading());
    try {
      token = await TokenUtils.getToken() ?? '';
      if (token.isEmpty) {
        emit(const ServicesState.unauthorized());
        return;
      }

      final req = await ServiceSpaNetwork().getServices(token);

      return req.fold(
        (l) {
          if (l.statusCode == 401) {
            emit(const ServicesState.unauthorized());
          } else {
            emit(ServicesState.error(l.message));
          }
        },
        (r) => emit(ServicesState.loaded(r)),
      );
    } catch (e) {
      emit(ServicesState.error(e.toString()));
    }
  }
}
