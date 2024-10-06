import 'package:flutter/material.dart';
import 'settings_service.dart';

class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService;

  // ThemeMode and Locale private variables.
  late ThemeMode _themeMode;
  late Locale _locale;

  // Allow Widgets to read the user's preferred ThemeMode and Locale.
  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;

  /// Load the user's settings from the SettingsService.
  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _locale = await _settingsService.locale();

    // Inform listeners that the settings have been loaded.
    notifyListeners();
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null || newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;
    notifyListeners();
    await _settingsService.updateThemeMode(newThemeMode);
  }

  /// Update and persist the Locale based on the user's selection.
  Future<void> updateLocale(Locale? newLocale) async {
    if (newLocale == null || newLocale == _locale) return;

    _locale = newLocale;
    notifyListeners();
    await _settingsService.updateLocale(newLocale);
  }
}
