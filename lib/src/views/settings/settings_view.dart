import 'package:boton_cosib/src/menu/AppDrawer.dart';
import 'package:flutter/material.dart';

import '../../preferences/settings_controller.dart';

/// Muestra las distintas configuraciones que el usuario puede personalizar, incluyendo
/// la información del usuario y la selección del tema.
///
/// Cuando un usuario cambia una configuración, el SettingsController se actualiza y
/// los Widgets que escuchan al SettingsController se reconstruyen.
class SettingsView extends StatefulWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late TextEditingController _nombreCompletoController;
  late TextEditingController _matriculaController;
  late TextEditingController _numeroTelefonoController;
  late TextEditingController _correoElectronicoController;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _nombreCompletoController = TextEditingController();
    _matriculaController = TextEditingController();
    _numeroTelefonoController = TextEditingController();
    _correoElectronicoController = TextEditingController();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    await widget.controller
        .loadSettings(); // Asegurarse de que los datos estén cargados
    final user = widget.controller.user;

    setState(() {
      _nombreCompletoController.text = user?.nombreCompleto ?? '';
      _matriculaController.text = user?.matricula ?? '';
      _numeroTelefonoController.text = user?.numeroTelefono ?? '';
      _correoElectronicoController.text = user?.correoElectronico ?? '';
      _isLoading = false; // Finaliza el estado de carga
    });
  }

  void _updateUserData(String field, String value) {
    final user = widget.controller.user?.copyWith(
      nombreCompleto: field == 'nombreCompleto'
          ? value
          : widget.controller.user?.nombreCompleto,
      matricula:
          field == 'matricula' ? value : widget.controller.user?.matricula,
      numeroTelefono: field == 'numeroTelefono'
          ? value
          : widget.controller.user?.numeroTelefono,
      correoElectronico: field == 'correoElectronico'
          ? value
          : widget.controller.user?.correoElectronico,
    );
    if (user != null) {
      widget.controller.updateUser(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      drawer: const AppDrawer(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Mostrar indicador de carga
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Sección de información del usuario
                  const Text(
                    'Información del Usuario',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _buildTextField(
                    controller: _nombreCompletoController,
                    label: 'Nombre Completo',
                    field: 'nombreCompleto',
                  ),
                  _buildTextField(
                    controller: _matriculaController,
                    label: 'Matrícula',
                    field: 'matricula',
                  ),
                  _buildTextField(
                    controller: _numeroTelefonoController,
                    label: 'Número de Teléfono',
                    field: 'numeroTelefono',
                  ),
                  _buildTextField(
                    controller: _correoElectronicoController,
                    label: 'Correo Electrónico',
                    field: 'correoElectronico',
                  ),
                  const SizedBox(height: 20),
                  // Sección para la selección del tema
                  const Text(
                    'Tema',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<ThemeMode>(
                    value: widget.controller.themeMode,
                    onChanged: (ThemeMode? newThemeMode) {
                      if (newThemeMode != null) {
                        widget.controller.updateThemeMode(newThemeMode);
                      }
                    },
                    items: const [
                      DropdownMenuItem(
                        value: ThemeMode.system,
                        child: Text('Tema del Sistema'),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text('Tema Claro'),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text('Tema Oscuro'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String field,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              _updateUserData(field, controller.text);
            },
          ),
        ),
        onChanged: (value) {
          // Actualizar los datos del usuario en tiempo real
          _updateUserData(field, value);
        },
      ),
    );
  }

  @override
  void dispose() {
    _nombreCompletoController.dispose();
    _matriculaController.dispose();
    _numeroTelefonoController.dispose();
    _correoElectronicoController.dispose();
    super.dispose();
  }
}
