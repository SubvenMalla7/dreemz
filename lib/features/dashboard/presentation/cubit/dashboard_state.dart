part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(0) int currentIndex,
    @Default(ActionState.initial) ActionState? state,
    @Default('') String errorMessage,
    @Default('') String successMessage,
    @Default([]) List<PixabayImage> searchResults,
    @Default([]) List<PixabayImage> favorites,
    @Default(0) int totalHits,
  }) = _DashboardState;
}
