import 'package:flutter/material.dart';
import 'settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theme Dropdown
            DropdownButton<ThemeMode>(
              value: controller.themeMode,
              onChanged: controller.updateThemeMode,
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark Theme'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Language Dropdown
            DropdownButton<Locale>(
              value: controller.locale,
              onChanged: (Locale? newLocale) {
                if (newLocale != null) {
                  controller.updateLocale(newLocale);
                }
              },
              items: const [
                DropdownMenuItem(
                  value: Locale('en', ''),
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: Locale('de', ''),
                  child: Text('Deutsch'),
                ),
                DropdownMenuItem(
                  value: Locale('tr', ''),
                  child: Text('Türkçe'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
