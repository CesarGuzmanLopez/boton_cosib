import 'dart:async';

import 'package:boton_cosib/src/Services/AllertService.dart';
import 'package:boton_cosib/src/menu/AppDrawer.dart';
import 'package:boton_cosib/src/preferences/BotonPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

class BotonView extends StatefulWidget {
  static const routeName = '/';

  const BotonView({
    super.key,
    required this.botonPreferences,
    required this.alertservice,
  });

  final BotonPreferences botonPreferences;
  final Alertservice alertservice;

  @override
  _BotonViewState createState() =>
      _BotonViewState(botonPreferences, alertservice);
}

class _BotonViewState extends State<BotonView> {
  static const initTimer = 3;
  late int inactivityDuration;

  final BotonPreferences _botonPreferences;
  final Alertservice _alertservice;

  int _start = initTimer;
  Timer? _timer;
  Timer? _inactivityTimer;
  bool _isConnected = true;

  _BotonViewState(this._botonPreferences, this._alertservice) {
    _checkInitialButtonState();
    inactivityDuration =
        int.parse(dotenv.env['TIEMPO_CHECAR_CONEXION_MILISEGUNDOS'] ?? '1500');
    print('Inactivity duration: $inactivityDuration');
  }

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();

    // Verifico cada 1.5 segundos si hay conexión y si sale de la página o app se para el timer
    _inactivityTimer = Timer.periodic(
      Duration(milliseconds: inactivityDuration),
      (timer) {
        if (mounted) {
          _checkInternetConnection();
        }
      },
    );
  }

  Future<void> _checkInternetConnection() async {
    _isConnected = await _alertservice.verificarConexion();
    if (mounted) {
      setState(() {});
    }
  }

  void _checkInitialButtonState() async {
    bool isPressed = await _botonPreferences.isBotonPresionado();
    if (isPressed) {
      Navigator.pushNamed(context, '/alerta');
    }
  }

  void _startTimer() {
    _resetTimer();
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (_start == 0) {
        timer.cancel();
        _sendAlert();
      } else {
        if (mounted) {
          setState(() {
            _start--;
          });
        }
      }
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    if (mounted) {
      setState(() {
        _start = initTimer;
      });
    }
  }

  void _handleTap() {
    if (_isConnected) {
      // Inicia el temporizador si hay conexión
      if (_start > 0) {
        if (mounted) {
          setState(() {
            _start--;
          });
        }
        if (_start == 0) {
          _sendAlert();
        }
      }
      _resetInactivityTimer();
    } else {
      // Si no hay conexión, realizar la llamada al 911 directamente
      _callEmergencyNumber();
    }
  }

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(
      Duration(milliseconds: inactivityDuration),
      () {
        if (mounted) {
          setState(() {
            _start = initTimer;
          });
        }
      },
    );
  }

  Future<void> _sendAlert() async {
    if (await _alertservice.verificarConexion()) {
      try {
        _alertservice.enviarAlerta();
        Navigator.pushNamed(context, '/alerta');
      } catch (e) {
        _showErrorDialog('Error al enviar la alerta',
            'Error: no se pudo enviar la alerta, error servidor.',
            isEmergency: true);
        Navigator.pushNamed(context, '/');
      }
    } else {
      _showErrorDialog('No hay conexión a internet o al servidor',
          'No se pudo enviar la alerta, llamar al 911.',
          isEmergency: true);
    }
  }

  void _callEmergencyNumber() {
    launchUrl(Uri.parse('tel:911'));
  }

  void _showErrorDialog(String title, String content,
      {bool isEmergency = false}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (isEmergency) {
                  _callEmergencyNumber();
                }
              },
              child: Text(isEmergency ? 'Llamar al 911' : 'Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Botón de Emergencia'),
      ),
      body: Center(
        child: _buildEmergencyButton(),
      ),
    );
  }

  Widget _buildEmergencyButton() {
    return Card(
      color: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Mantén presionado el botón de pánico dentro de las instalaciones de la UAM para enviar una alerta.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (!_isConnected)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Por el momento no pareces tener conexión a internet o el servidor de asistencia no está en línea. '
                  'Llama al 911 directamente.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 92, 2,
                        87), // Puedes ajustar el color a tu preferencia
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                GestureDetector(
                  onLongPress: _isConnected ? _startTimer : null,
                  onLongPressUp: _resetTimer,
                  onTap: _handleTap,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _isConnected ? Colors.red : Colors.blue,
                      border: Border.all(
                        color: Colors.white,
                        width: 5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        _isConnected ? '$_start' : '911',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _inactivityTimer?.cancel();
    super.dispose();
  }
}
