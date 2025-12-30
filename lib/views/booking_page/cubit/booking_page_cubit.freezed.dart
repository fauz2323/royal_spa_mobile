// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingPageState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BookingPageState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BookingPageState()';
  }
}

/// @nodoc
class $BookingPageStateCopyWith<$Res> {
  $BookingPageStateCopyWith(
      BookingPageState _, $Res Function(BookingPageState) __);
}

/// Adds pattern-matching-related methods to [BookingPageState].
extension BookingPageStatePatterns on BookingPageState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Error() when error != null:
        return error(_that);
      case _Unauthorized() when unauthorized != null:
        return unauthorized(_that);
      case _Success() when success != null:
        return success(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Success value) success,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Loaded():
        return loaded(_that);
      case _Error():
        return error(_that);
      case _Unauthorized():
        return unauthorized(_that);
      case _Success():
        return success(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Success value)? success,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Error() when error != null:
        return error(_that);
      case _Unauthorized() when unauthorized != null:
        return unauthorized(_that);
      case _Success() when success != null:
        return success(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ServiceSpaDetailModel data, DateTime? selectedDate,
            TimeOfDay? selectedTime, List<TimeSlot>? timeSlotByDuration)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? unauthorized,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(_that.data, _that.selectedDate, _that.selectedTime,
            _that.timeSlotByDuration);
      case _Error() when error != null:
        return error(_that.message);
      case _Unauthorized() when unauthorized != null:
        return unauthorized();
      case _Success() when success != null:
        return success();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            ServiceSpaDetailModel data,
            DateTime? selectedDate,
            TimeOfDay? selectedTime,
            List<TimeSlot>? timeSlotByDuration)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() unauthorized,
    required TResult Function() success,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Loaded():
        return loaded(_that.data, _that.selectedDate, _that.selectedTime,
            _that.timeSlotByDuration);
      case _Error():
        return error(_that.message);
      case _Unauthorized():
        return unauthorized();
      case _Success():
        return success();
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ServiceSpaDetailModel data, DateTime? selectedDate,
            TimeOfDay? selectedTime, List<TimeSlot>? timeSlotByDuration)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? unauthorized,
    TResult? Function()? success,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(_that.data, _that.selectedDate, _that.selectedTime,
            _that.timeSlotByDuration);
      case _Error() when error != null:
        return error(_that.message);
      case _Unauthorized() when unauthorized != null:
        return unauthorized();
      case _Success() when success != null:
        return success();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements BookingPageState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BookingPageState.initial()';
  }
}

/// @nodoc

class _Loading implements BookingPageState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BookingPageState.loading()';
  }
}

/// @nodoc

class _Loaded implements BookingPageState {
  const _Loaded(this.data, this.selectedDate, this.selectedTime,
      final List<TimeSlot>? timeSlotByDuration)
      : _timeSlotByDuration = timeSlotByDuration;

  final ServiceSpaDetailModel data;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final List<TimeSlot>? _timeSlotByDuration;
  List<TimeSlot>? get timeSlotByDuration {
    final value = _timeSlotByDuration;
    if (value == null) return null;
    if (_timeSlotByDuration is EqualUnmodifiableListView)
      return _timeSlotByDuration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.selectedTime, selectedTime) ||
                other.selectedTime == selectedTime) &&
            const DeepCollectionEquality()
                .equals(other._timeSlotByDuration, _timeSlotByDuration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, selectedDate, selectedTime,
      const DeepCollectionEquality().hash(_timeSlotByDuration));

  @override
  String toString() {
    return 'BookingPageState.loaded(data: $data, selectedDate: $selectedDate, selectedTime: $selectedTime, timeSlotByDuration: $timeSlotByDuration)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $BookingPageStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call(
      {ServiceSpaDetailModel data,
      DateTime? selectedDate,
      TimeOfDay? selectedTime,
      List<TimeSlot>? timeSlotByDuration});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? selectedDate = freezed,
    Object? selectedTime = freezed,
    Object? timeSlotByDuration = freezed,
  }) {
    return _then(_Loaded(
      null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ServiceSpaDetailModel,
      freezed == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      freezed == selectedTime
          ? _self.selectedTime
          : selectedTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      freezed == timeSlotByDuration
          ? _self._timeSlotByDuration
          : timeSlotByDuration // ignore: cast_nullable_to_non_nullable
              as List<TimeSlot>?,
    ));
  }
}

/// @nodoc

class _Error implements BookingPageState {
  const _Error({required this.message});

  final String message;

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'BookingPageState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $BookingPageStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of BookingPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Error(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Unauthorized implements BookingPageState {
  const _Unauthorized();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Unauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BookingPageState.unauthorized()';
  }
}

/// @nodoc

class _Success implements BookingPageState {
  const _Success();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BookingPageState.success()';
  }
}

// dart format on
