import 'package:app_ui/app_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

@lazySingleton
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AppService appService})
    : _appService = appService,
      super(
        AppState(
          themeMode: appService.themeMode(),
          locale: appService.locale(),
          themeData: appService.themeData(),
        ),
      ) {
    on<UpdateThemeEvent>(_onUpdateTheme);
    on<UpdateLocaleEvent>(_onUpdateLocale);
  }

  final AppService _appService;

  Future<void> _onUpdateTheme(UpdateThemeEvent event, Emitter emit) async {
    final newThemeMode = event.newThemeMode;
    if (newThemeMode == null || newThemeMode == state.themeMode) return;

    await _appService.updateThemeMode(newThemeMode);

    emit(
      state.copyWith(
        themeMode: newThemeMode,
        themeData: _appService.themeData(),
      ),
    );
  }

  Future<void> _onUpdateLocale(UpdateLocaleEvent event, Emitter emit) async {
    final newLocale = event.newLocale;
    if (newLocale == null || newLocale == state.locale) return;

    await _appService.updateLocale(newLocale);

    emit(state.copyWith(locale: newLocale));
  }
}
