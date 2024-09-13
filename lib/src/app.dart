import 'package:boton_api/boton_api.dart';
import 'package:boton_cosib/src/Services/AlertService.dart';
import 'package:boton_cosib/src/Services/ChatService.dart';
import 'package:boton_cosib/src/app_routes.dart';
import 'package:boton_cosib/src/preferences/BotonPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'preferences/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.settingsController,
    required BotonApi botonApi,
    required ChatService chatService,
  }) {
    alertService = AlertService(botonApi: botonApi);
    _chatService = chatService;
  }
  late final AlertService alertService;
  final SettingsController settingsController;
  final BotonPreferences botonPreferences = BotonPreferences();
  late ChatService _chatService;
  late final BotonApi botonApi;
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            restorationScopeId: 'app',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
            ],
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,
            onGenerateRoute: (settings) => generateRoute(
                settings,
                settingsController,
                botonPreferences,
                alertService,
                _chatService));
      },
    );
  }
}
