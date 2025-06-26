part of 'app_bloc.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    ThemeMode? themeMode,
    Locale? locale,
    ThemeData? themeData,
  }) = _AppState;

  const AppState._();
}
