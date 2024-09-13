import 'dart:io';

import 'package:boton_api/boton_api.dart';
import 'package:boton_cosib/src/Services/ChatService.dart';
import 'package:boton_cosib/src/app.dart';
import 'package:boton_cosib/src/preferences/UserPreferences.dart';
import 'package:boton_cosib/src/preferences/settings_controller.dart';
import 'package:boton_cosib/src/views/settings/settings_service.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  await dotenv.load(fileName: ".env"); // Carga el archivo .env
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializar UserPreferences
  final userPreferences = UserPreferences();
  final settingsService = SettingsService();
  // Obtener el token Bearer y la URL base
  final String bearerToken = await userPreferences.getBearerToken() ?? '';

  //obtengo dependiendo si es web o mobile
  String baseUrl = "";
  if (!kIsWeb) {
    baseUrl =
        dotenv.env['BASE_URL_API_MOBILE'] ?? 'http://localhost:8080/boton';
  } else {
    baseUrl = dotenv.env['BASE_URL_API_WEB'] ?? '/boton';
  }

  // Inicializar BotonApi
  final botonApi = BotonApi(
    basePathOverride: baseUrl,
  );
  String baseWsUrl =
      dotenv.env['BASE_URL_WS'] ?? 'ws://localhost:8080/boton/ws';
  if (kIsWeb) {
    baseWsUrl = dotenv.env['BASE_URL_WS_WEB'] ?? 'ws:/boton/ws';
  } else {
    baseWsUrl = dotenv.env['BASE_URL_WS'] ?? 'ws://localhost:8080/boton/ws';
  }
  final chatService = ChatService(url: baseWsUrl);

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
    chatService: chatService,
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
