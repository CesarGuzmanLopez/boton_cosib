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

  void _updateUserData() {
    final nombreCompleto = _nombreCompletoController.text;
    final matricula = _matriculaController.text;
    final numeroTelefono = _numeroTelefonoController.text;
    final correoElectronico = _correoElectronicoController.text;
    print("numeroTelefono: $numeroTelefono");
    print("matricula: $matricula");
    if (_isValidMatricula(matricula) &&
        _isValidNumeroTelefono(numeroTelefono) &&
        _isValidCorreoElectronico(correoElectronico)) {
      final user = widget.controller.user?.copyWith(
        nombreCompleto: nombreCompleto.isNotEmpty ? nombreCompleto : null,
        matricula: matricula.isNotEmpty ? matricula : null,
        numeroTelefono: numeroTelefono.isNotEmpty ? numeroTelefono : null,
        correoElectronico:
            correoElectronico.isNotEmpty ? correoElectronico : null,
      );
      if (user != null) {
        widget.controller.updateUser(user);
        _showModificadoCorrectamente();
      }
    } else {
      _showErrorDialog();
    }
  }

  _showModificadoCorrectamente() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Datos Modificados'),
          content: const Text('Los datos se han modificado correctamente.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  bool _isValidMatricula(String matricula) {
    if (matricula.isEmpty) {
      return true;
    }
    final numericMatricula = int.tryParse(matricula);
    return numericMatricula != null &&
        matricula.length >= 10 &&
        matricula.length <= 12;
  }

  bool _isValidNumeroTelefono(String numeroTelefono) {
    if (numeroTelefono.isEmpty) {
      return true;
    }
    final numericTelefono = int.tryParse(numeroTelefono);
    return numericTelefono != null &&
        numeroTelefono.length >= 8 &&
        numeroTelefono.length <= 12;
  }

  bool _isValidCorreoElectronico(String correoElectronico) {
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return correoElectronico.isEmpty || emailRegExp.hasMatch(correoElectronico);
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Datos inválidos'),
          content: const Text(
              'Por favor, verifica que todos los datos sean correctos.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
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
                  // Mensaje informativo
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                        'Aquí puedes modificar tus datos. Estos datos personales no serán utilizados solo hasta que envíes un reporte. Nuestros servidores no almacenan tus datos personales en ningún momento, solo se utilizan para identificarte en caso de que envíes un reporte.',
                        style: TextStyle(fontSize: 16)),
                  ),
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
                    label: 'Matrícula o Número de Empleado',
                    field: 'matricula',
                    keyboardType: TextInputType.number,
                  ),
                  _buildTextField(
                    controller: _numeroTelefonoController,
                    label: 'Número de Teléfono',
                    field: 'numeroTelefono',
                    keyboardType: TextInputType.number,
                  ),
                  _buildTextField(
                    controller: _correoElectronicoController,
                    label: 'Correo Electrónico',
                    field: 'correoElectronico',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  // Botón para guardar los datos
                  ElevatedButton(
                    onPressed: _updateUserData,
                    child: const Text('Guardar'),
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
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
        keyboardType: keyboardType,
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
