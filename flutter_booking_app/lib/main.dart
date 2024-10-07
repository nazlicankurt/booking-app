import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'core/services/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  await di.init();

  runApp(MyApp(settingsController: settingsController));
}
