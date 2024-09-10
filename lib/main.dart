import 'package:boton_cosib/src/app.dart';
import 'package:boton_cosib/src/preferences/UserPreferences.dart';
import 'package:boton_cosib/src/preferences/settings_controller.dart';
import 'package:boton_cosib/src/views/settings/settings_service.dart';
import 'package:flutter/material.dart';

void main() async {
  // Asegúrate de inicializar el entorno de Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa SettingsService y UserPreferences
  final settingsService = SettingsService();
  final userPreferences = UserPreferences();

  // Crea el SettingsController
  final settingsController =
      SettingsController(settingsService, userPreferences);

  // Carga la configuración inicial
  await settingsController.loadSettings();

  // Ejecuta la aplicación
  runApp(MyApp(settingsController: settingsController));
}
