import 'dart:async';

import 'package:boton_cosib/src/Services/AllertService.dart';
import 'package:boton_cosib/src/menu/AppDrawer.dart';
import 'package:boton_cosib/src/preferences/BotonPreferences.dart';
import 'package:flutter/material.dart';
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
  static const inactivityDuration = 1500; // 1.5 segundos en milisegundos
  final BotonPreferences _botonPreferences;
  final Alertservice _alertservice;
  _BotonViewState(this._botonPreferences, this._alertservice) {
    //si el boton esta presionado redirijo a la pagina de alerta
    this._botonPreferences.isBotonPresionado().then((isPressed) {
      if (isPressed) {
        Navigator.pushNamed(context, '/alerta');
      }
    });
  }
  int _start = initTimer; // Temporizador en segundos
  Timer? _timer;
  Timer? _inactivityTimer;

  @override
  void initState() {
    super.initState();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _start = initTimer; // Reinicia el temporizador a 3 segundos
    });
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (_start == 0) {
        timer.cancel();
        _sendAlert();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _start = initTimer;
    });
  }

  void _decrementStart() {
    if (_start > 0) {
      setState(() {
        _start--;
      });
      if (_start == 0) {
        _sendAlert();
      }
    }
    _resetInactivityTimer();
  }

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer =
        Timer(const Duration(milliseconds: inactivityDuration), () {
      setState(() {
        _start = initTimer;
      });
    });
  }

  Future<void> _sendAlert() async {
    //VERIFICO SI HAY CONEXION A INTERNET Y SI HAY CONEXION CON EL SERVIDOR
    if (await _alertservice.verificarConexion()) {
      //verifico si esta adentro de la UAM
      if (await _alertservice.verificarUbicacionUAM()) {
        _botonPreferences.setBotonPresionado(isPressed: true);
        _alertservice.enviarAlerta();
        Navigator.pushNamed(context, '/alerta');
      } else {
        // no se pudo envar la alerta ya que no esta en la uam enviar

        _alertservice.enviarAlertaFueraUAM();
        _botonPreferences.setBotonPresionado(isPressed: true, isUAM: false);
        //muestro un dialogo de que llame al 911 porque no esta en la UAM
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('No estás en la UAM'),
              content: const Text(
                  'No se pudo enviar la alerta, por favor, llamar al 911.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    //Llamar al 911
                    launchUrl(Uri.parse('tel:911'));
                    _botonPreferences.setBotonPresionado(isPressed: true);
                    Navigator.pushNamed(context, '/alerta');
                  },
                  child: const Text('Llamar al 911'),
                ),
              ],
            );
          },
        );
      }
    } else {
      // si no hay conexion mando una alerta en espera y lo redirijo para llamar al 911
      // muestro una alerta y lo redirecciono a la pantalla de llamada al 911
      //que habra la aplicacion de telefono con un tel:911
      //Dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('No hay conexión a internet o el servidor '),
            content: const Text(
                'No se pudo enviar la alerta, por favor, llamar al 911.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  //Llamar al 911

                  launchUrl(Uri.parse('tel:911'));
                },
                child: const Text('Llamar al 911'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Botón de Emergencia'),
      ),
      body: Center(
        child: Card(
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
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onLongPress: _startTimer,
                      onLongPressUp: _stopTimer,
                      onTap:
                          _decrementStart, // Descuenta uno al contador con un tap rápido
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                          border: Border.all(
                            color: Colors.white, // Color del borde
                            width: 5, // Ancho del borde
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '$_start',
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
