part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class UpdateThemeEvent extends AppEvent {
  const UpdateThemeEvent(this.newThemeMode);

  final ThemeMode? newThemeMode;
}

class UpdateLocaleEvent extends AppEvent {
  const UpdateLocaleEvent(this.newLocale);

  final Locale? newLocale;
}
