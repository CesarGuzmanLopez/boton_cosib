// app_routes.dart
import 'package:boton_cosib/src/Services/AllertService.dart';
import 'package:boton_cosib/src/preferences/BotonPreferences.dart';
import 'package:boton_cosib/src/views/Alerta/alertaView.dart';
import 'package:boton_cosib/src/views/Boton/boton.dart';
import 'package:flutter/material.dart';

import 'preferences/settings_controller.dart';
import 'views/settings/settings_view.dart';

Route<dynamic> generateRoute(
    RouteSettings settings,
    SettingsController settingsController,
    BotonPreferences botonPreferences,
    Alertservice alertservice) {
  switch (settings.name) {
    case SettingsView.routeName:
      return MaterialPageRoute(
        builder: (context) => SettingsView(controller: settingsController),
      );
    case BotonView.routeName:
      return MaterialPageRoute(
          builder: (context) => BotonView(
                botonPreferences: botonPreferences,
                alertservice: alertservice,
              ));
    case AlertaView.routeName:
      return MaterialPageRoute(
          builder: (context) => AlertaView(
                botonPreferences: botonPreferences,
                alertservice: alertservice,
              ));
    default:
      return MaterialPageRoute(
          builder: (context) => Material(
                // Material
                child: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}
