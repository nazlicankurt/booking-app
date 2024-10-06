import 'package:flutter/material.dart';

class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async => ThemeMode.system;

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use shared_preferences or any other mechanism to persist settings locally.
  }

  /// Loads the User's preferred Locale from local or remote storage.
  Future<Locale> locale() async => const Locale('en', ''); // Default locale to English

  /// Persists the user's preferred Locale to local or remote storage.
  Future<void> updateLocale(Locale locale) async {
    // Use shared_preferences or any other mechanism to persist settings locally.
  }
}
