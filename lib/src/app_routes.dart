// app_routes.dart
import 'package:boton_cosib/src/Services/AlertService.dart';
import 'package:boton_cosib/src/Services/ChatService..dart';
import 'package:boton_cosib/src/preferences/BotonPreferences.dart';
import 'package:boton_cosib/src/views/Alerta/alertaTypeView.dart';
import 'package:boton_cosib/src/views/Alerta/alertaView.dart';
import 'package:boton_cosib/src/views/Alerta/chatView.dart';
import 'package:boton_cosib/src/views/Boton/boton.dart';
import 'package:flutter/material.dart';

import 'preferences/settings_controller.dart';
import 'views/settings/settings_view.dart';

Route<dynamic> generateRoute(
  RouteSettings settings,
  SettingsController settingsController,
  BotonPreferences botonPreferences,
  AlertService alertservice,
  ChatService chatService,
) {
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
                chatService: chatService,
              ));
    case AlertaView.routeName:
      return MaterialPageRoute(
          builder: (context) => AlertaView(
                botonPreferences: botonPreferences,
                alertservice: alertservice,
              ));
    case AlertaTypeView.routeName:
      return MaterialPageRoute(
          builder: (context) => AlertaTypeView(
                botonPreferences: botonPreferences,
                alertservice: alertservice,
              ));
    case ChatView.routeName: // Add this case
      return MaterialPageRoute(
          builder: (context) => ChatView(
                chatService: chatService,
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
