import 'dart:async';

import 'package:boton_cosib/src/menu/AppDrawer.dart';
import 'package:boton_cosib/src/preferences/BotonPreferences.dart';
import 'package:flutter/material.dart';

class BotonView extends StatefulWidget {
  static const routeName = '/';

  const BotonView({
    super.key,
    required this.botonPreferences,
  });

  final BotonPreferences botonPreferences;

  @override
  _BotonViewState createState() => _BotonViewState();
}

class _BotonViewState extends State<BotonView> {
  static const initTimer = 3;
  static const inactivityDuration = 1500; // 1.5 segundos en milisegundos

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
      _start = initTimer; // Reinicia el temporizador a 3 segundos
    });
  }

  void _decrementStart() {
    if (_start > 0) {
      setState(() {
        _start--;
      });
      if (_start == 0) {
        _sendAlert(); // Llama a la alerta si llega a 0 con los taps rápidos
      }
    }
    _resetInactivityTimer(); // Reinicia el temporizador de inactividad
  }

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer =
        Timer(const Duration(milliseconds: inactivityDuration), () {
      setState(() {
        _start =
            initTimer; // Reinicia el contador si pasan 1.5 segundos sin acción
      });
    });
  }

  void _sendAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alerta de Emergencia'),
          content: const Text('¡Se ha enviado una alerta de emergencia!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
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
