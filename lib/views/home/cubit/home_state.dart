part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial(int index) = _Initial;
  const factory HomeState.selected(int index) = _Selected;
}
