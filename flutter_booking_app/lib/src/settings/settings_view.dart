import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'settings_controller.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: controller.loadSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Settings'),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Settings'),
            ),
            body: const Center(child: Text('Error loading settings')),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<ThemeMode>(
                  value: controller.themeMode,
                  onChanged: (ThemeMode? newThemeMode) {
                    print('Theme changed to: $newThemeMode');

                    controller.updateThemeMode(newThemeMode);
                  },
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
                DropdownButton<Locale>(
                  value: controller.locale,
                  onChanged: (Locale? newLocale) {
                    print('Language changed to: $newLocale');

                    controller.updateLocale(newLocale);
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
      },
    );
  }
}
