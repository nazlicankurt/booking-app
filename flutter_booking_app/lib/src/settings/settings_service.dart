import 'package:flutter/material.dart';

class SettingsService {
  Future<ThemeMode> themeMode() async => ThemeMode.system;

  Future<void> updateThemeMode(ThemeMode theme) async {
  }

  Future<Locale> locale() async => const Locale('de', ''); 

  Future<void> updateLocale(Locale locale) async {
  }
}
