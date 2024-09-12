import 'package:boton_cosib/src/Services/AllertService.dart';
import 'package:boton_cosib/src/menu/AppDrawer.dart';
import 'package:boton_cosib/src/model/alertType.dart';
import 'package:boton_cosib/src/preferences/BotonPreferences.dart';
import 'package:boton_cosib/src/views/Alerta/alertaTypeView.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AlertaView extends StatefulWidget {
  static const routeName = '/alerta';

  const AlertaView({
    super.key,
    required this.botonPreferences,
    required this.alertservice,
  });

  final BotonPreferences botonPreferences;
  final Alertservice alertservice;

  @override
  _AlertaViewState createState() =>
      _AlertaViewState(botonPreferences, alertservice);
}

class _AlertaViewState extends State<AlertaView> {
  final BotonPreferences _botonPreferences;
  final Alertservice _alertservice;
  bool _estaEnLaUAM = false;
  bool _isLoading = true;
  final TextEditingController _ubicacionController = TextEditingController();

  _AlertaViewState(this._botonPreferences, this._alertservice);

  @override
  void initState() {
    super.initState();
    _checkIfInUAM();
  }

  Future<void> _checkIfInUAM() async {
    bool isPressed = await _botonPreferences.isBotonPresionado();
    if (!isPressed) {
      Navigator.pushNamed(context, '/');
    } else {
      bool isUAM = await _alertservice.isUAM();
      setState(() {
        _estaEnLaUAM = isUAM;
        _isLoading = false;
      });
    }
  }

  void _handleAlertType(AlertButtonType type) {
    //envio un mensaje al servicio de alerta
    _alertservice.tipoAlerta(type).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Alerta enviada correctamente'),
        ),
      );
      Navigator.pushNamed(context, AlertaTypeView.routeName);
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al enviar la alerta: $e'),
        ),
      );
    });
  }

  void _enviarUbicacion() {
    final ubicacion = _ubicacionController.text;
    if (ubicacion.isNotEmpty && ubicacion.length > 4) {
      _alertservice.enviarUbicacion(ubicacion).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Ubicación actualizada'),
          ),
        );
      });
      setState(() {
        _estaEnLaUAM = true;
        _isLoading = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, ingresa una ubicación.'),
        ),
      );
    }
  }

  void _reportar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Redirigiendo a la página de reporte'),
      ),
    );
    Navigator.pushNamed(context, AlertaTypeView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Botón de Emergencia'),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Botón de Emergencia'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (!_estaEnLaUAM) ...[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    textStyle: const TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  onPressed: () {
                    launchUrl(Uri.parse('tel:911'));
                  },
                  child: const Text('Llamar al 911'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Parece que no estás en la UAM. Si crees que es un error, por favor, ingresa tu ubicación a continuación:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _ubicacionController,
                  decoration: const InputDecoration(
                    labelText: 'Ubicación',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _enviarUbicacion,
                  child: const Text('Enviar'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _reportar,
                  child: const Text(
                      'No estoy en la UAM pero quiero enviar un reporte'),
                ),
                const SizedBox(height: 16),
              ] else ...[
                const Text(
                  'Tipo de alerta',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: AlertButtonType.values.map((type) {
                    return _buildAlertTypeIcon(
                      icon: type.icon,
                      label: type.label,
                      onTap: () => _handleAlertType(type),
                    );
                  }).toList(),
                ),
              ],
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  _alertservice.cancelarAlerta().then((value) {
                    Navigator.pushNamed(context, '/');
                  }).catchError((e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error al cancelar la alerta: $e'),
                      ),
                    );
                  });
                },
                child: const Text('Cancelar Alerta'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlertTypeIcon({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _ubicacionController.dispose();
    super.dispose();
  }
}
