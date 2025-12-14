part of 'booking_page_cubit.dart';

@freezed
class BookingPageState with _$BookingPageState {
  const factory BookingPageState.initial() = _Initial;
  const factory BookingPageState.loading() = _Loading;
  const factory BookingPageState.loaded(ServiceSpaDetailModel data,
      DateTime? selectedDate, TimeOfDay? selectedTime) = _Loaded;
  const factory BookingPageState.error({
    required String message,
  }) = _Error;
  const factory BookingPageState.unauthorized() = _Unauthorized;
  const factory BookingPageState.success() = _Success;
}
