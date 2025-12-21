import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_spa_garden_mobile/model/service_spa_detail_model.dart';
import 'package:royal_spa_garden_mobile/network/orders_network.dart';
import 'package:royal_spa_garden_mobile/network/service_spa_model.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';

part 'booking_page_state.dart';
part 'booking_page_cubit.freezed.dart';

class BookingPageCubit extends Cubit<BookingPageState> {
  BookingPageCubit() : super(const BookingPageState.initial());
  late String token;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  late ServiceSpaDetailModel serviceData;

  initial(String serviceId) async {
    emit(const BookingPageState.loading());
    try {
      // Simulate network call
      token = await TokenUtils.getToken() ?? '';
      // Here you would typically fetch data from a repository
      final serviceDetail =
          await ServiceSpaNetwork().getServiceDetail(token, serviceId);

      serviceDetail.fold(
        (networkError) {
          if (networkError.statusCode == 401) {
            emit(const BookingPageState.unauthorized());
          } else {
            emit(BookingPageState.error(message: networkError.message));
          }
        },
        (data) {
          serviceData = data;
          emit(BookingPageState.loaded(serviceData, null, null));
        },
      );
    } catch (e) {
      emit(BookingPageState.error(message: e.toString()));
    }
  }

  setDate(DateTime date) {
    selectedDate = date;

    emit(BookingPageState.loaded(serviceData, selectedDate, selectedTime));
  }

  setTime(TimeOfDay time) {
    selectedTime = time;
    emit(BookingPageState.loaded(serviceData, selectedDate, selectedTime));
  }

  submitData(String? notes) async {
    if (selectedTime == null || selectedDate == null) {
      return;
    }

    emit(const BookingPageState.loading());
    try {
      final orderMakeResponse = await OrdersNetwork().orderMake(
          token,
          serviceData.data.id.toString(),
          selectedTime!.toString().substring(10, 15),
          selectedDate!.toString().split(' ')[0],
          notes ?? '');

      orderMakeResponse.fold(
        (networkError) {
          if (networkError.statusCode == 401) {
            emit(const BookingPageState.unauthorized());
          } else {
            emit(BookingPageState.error(message: networkError.message));
          }
        },
        (data) {
          emit(const BookingPageState.success());
        },
      );
    } catch (e) {
      emit(BookingPageState.error(message: e.toString()));
    }
  }
}
