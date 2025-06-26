import 'package:app_ui/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:storage/storage.dart';

class AppService {
  AppService({required this.localStorage});

  final LocalStorage localStorage;

  // Cache for ThemeMode and Locale
  ThemeMode? _themeModeCache;
  Locale? _localeCache;

  // Single instances of themes
  final _lightTheme = AppLightTheme();
  final _darkTheme = AppDarkTheme();

  /// Returns the current ThemeMode.
  /// Uses cache if available, otherwise reads from local storage.
  ThemeMode themeMode() {
    if (_themeModeCache != null) return _themeModeCache!;

    final themeModeName = localStorage.getString(LocalStorageKey.themeMode);
    _themeModeCache = ThemeMode.values.byName(
      themeModeName ?? ThemeMode.system.name,
    );
    return _themeModeCache!;
  }

  /// Returns ThemeData based on the current ThemeMode.
  ThemeData themeData() {
    final mode = themeMode();
    return switch (mode) {
      ThemeMode.light => _lightTheme.themeData,
      ThemeMode.dark => _darkTheme.themeData,
      ThemeMode.system => ThemeData.fallback(),
    };
  }

  /// Updates ThemeMode in local storage and cache.
  Future<void> updateThemeMode(ThemeMode theme) async {
    await localStorage.setString(LocalStorageKey.themeMode, theme.name);
    _themeModeCache = theme;
  }

  /// Returns the current Locale.
  /// Uses cache if available, otherwise reads from local storage.
  Locale locale() {
    if (_localeCache != null) return _localeCache!;

    final localeStr = localStorage.getString(LocalStorageKey.locale);
    _localeCache = Locale(localeStr ?? "ru");
    return _localeCache!;
  }

  /// Updates Locale in local storage and cache.
  Future<void> updateLocale(Locale locale) async {
    await localStorage.setString(LocalStorageKey.locale, locale.languageCode);
    _localeCache = locale;
  }
}
