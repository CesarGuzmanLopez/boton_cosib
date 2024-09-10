import 'package:boton_cosib/src/views/Boton/boton.dart';
import 'package:boton_cosib/src/views/settings/settings_view.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 64, 155, 12),
            ),
            child: Text(
              'Menú de Navegación',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.emergency),
            title: const Text('Botón de Emergencia'),
            onTap: () {
              Navigator.pushReplacementNamed(context, BotonView.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            onTap: () {
              Navigator.pushReplacementNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
