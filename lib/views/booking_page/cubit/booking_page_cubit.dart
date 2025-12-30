import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:royal_spa_garden_mobile/model/service_spa_detail_model.dart';
import 'package:royal_spa_garden_mobile/network/orders_network.dart';
import 'package:royal_spa_garden_mobile/network/service_spa_model.dart';
import 'package:royal_spa_garden_mobile/utils/time_utils.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';

import '../../../model/network_model.dart';
import '../../../model/time_slot_list_model.dart';

part 'booking_page_state.dart';

part 'booking_page_cubit.freezed.dart';

class BookingPageCubit extends Cubit<BookingPageState> {
  BookingPageCubit()
      : serviceSpaNetwork = ServiceSpaNetwork(),
        super(const BookingPageState.initial());

  late String token;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  List<TimeSlot>? timeSlotByDuration;

  late ServiceSpaDetailModel serviceData;
  final ServiceSpaNetwork serviceSpaNetwork;

  final dateFormatter = DateFormat('yyyy-MM-dd');

  initial(String serviceId) async {
    emit(const BookingPageState.loading());
    try {
      // Simulate network call
      token = await TokenUtils.getToken() ?? '';
      // Here you would typically fetch data from a repository
      final serviceDetail =
          await serviceSpaNetwork.getServiceDetail(token, serviceId);

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
          emit(BookingPageState.loaded(serviceData, null, null, null));
        },
      );
    } catch (e) {
      emit(BookingPageState.error(message: e.toString()));
    }
  }

  Future<void> setDate(DateTime date) async {
    selectedDate = date;

    final dateStr = dateFormatter.format(date);
    final duration = serviceData.data.duration;
    final timeSlotResponse = await serviceSpaNetwork.getAvailableTimeSlots(
      token,
      dateStr,
    );

    timeSlotResponse.fold(
      (networkError) {
        emit(BookingPageState.error(message: networkError.message));
      },
      (timeSlot) {
        timeSlotByDuration = _getTimeSlotByDuration(
          timeSlot.data,
          duration,
        );
        emit(BookingPageState.loaded(
          serviceData,
          selectedDate,
          selectedTime,
          timeSlotByDuration,
        ));
      },
    );
  }

  setTime(TimeOfDay time) {
    selectedTime = time;
    emit(BookingPageState.loaded(
      serviceData,
      selectedDate,
      selectedTime,
      timeSlotByDuration,
    ));
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
          selectedTime!.to24HourString(),
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

  List<TimeSlot> _getTimeSlotByDuration(List<TimeSlot> slots, int duration) {
    final slotDuration = 15;
    final requiredSlots = (duration / slotDuration).ceil();

    final List<TimeSlot> availableStarts = [];

    // Single pass: track consecutive available slots
    int consecutiveAvailable = 0;

    for (int i = 0; i < slots.length; i++) {
      if (slots[i].available) {
        consecutiveAvailable++;

        // Check if we have enough consecutive slots ending at i
        if (consecutiveAvailable >= requiredSlots) {
          // Find start: i - requiredSlots + 1
          final startIndex = i - requiredSlots + 1;
          availableStarts.add(
            TimeSlot(
              timeStart: slots[startIndex].timeStart,
              timeEnd: slots[i].timeEnd,
              available: true,
            ),
          );
        }
      } else {
        consecutiveAvailable = 0; // Reset counter
      }
    }

    return availableStarts;
  }
}
