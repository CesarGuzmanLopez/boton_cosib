import 'package:boton_cosib/src/views/Boton/boton.dart';
import 'package:boton_cosib/src/views/ServiciosCsib/serviciosPage.dart';
import 'package:boton_cosib/src/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final String routeDownloadApk = dotenv.env['URL_DOWNLOAD_APK'] ?? '';
    return Drawer(
      child: Column(
        children: <Widget>[
          // Encabezado del Drawer con logotipos
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/logo1.png',
                          width: 80, // Ajusta el tamaño según sea necesario
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Opciones del menú
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.emergency),
                  title: const Text('Botón de Emergencia'),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, BotonView.routeName);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.medical_services),
                  title: const Text('Servicios de cosib'),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, ServicesPage.routeName);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Configuración'),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, SettingsView.routeName);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.download),
                  title: const Text('Descargar APK'),
                  onTap: () {
                    launchUrl(Uri.parse(routeDownloadApk));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
