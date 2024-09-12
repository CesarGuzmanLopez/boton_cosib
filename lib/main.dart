import 'package:boton_cosib/boton_api/lib/src/api.dart';
import 'package:boton_cosib/src/app.dart';
import 'package:boton_cosib/src/preferences/UserPreferences.dart';
import 'package:boton_cosib/src/preferences/settings_controller.dart';
import 'package:boton_cosib/src/views/settings/settings_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar UserPreferences
  final userPreferences = UserPreferences();
  final settingsService = SettingsService();

  // Obtener el token Bearer y la URL base
  final String bearerToken = await userPreferences.getBearerToken();
  const String baseUrl =
      'http://jquiroz.net:81/boton'; // Ajusta la URL base si es necesario

  // Inicializar BotonApi
  final botonApi = BotonApi(
    basePathOverride: baseUrl,
  );

  // Configurar el token Bearer si existe
  if (bearerToken.isNotEmpty) {
    botonApi.setBearerAuth('Bearer', bearerToken);
  }
  // Inicializar SettingsController
  final settingsController =
      SettingsController(settingsService, userPreferences);

  runApp(MyApp(
    settingsController: settingsController,
    botonApi: botonApi, // Pasar BotonApi al widget principal
  ));
}
