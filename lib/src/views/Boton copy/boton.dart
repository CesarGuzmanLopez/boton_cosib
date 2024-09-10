import 'package:boton_cosib/src/Services/AllertService.dart';
import 'package:boton_cosib/src/menu/AppDrawer.dart';
import 'package:boton_cosib/src/preferences/BotonPreferences.dart';
import 'package:flutter/material.dart';

class AlertaView extends StatefulWidget {
  static const routeName = '/alerta';

  AlertaView({
    super.key,
    required this.botonPreferences,
    required this.alertservice,
  }) {}

  final BotonPreferences botonPreferences;
  final Alertservice alertservice;
  @override
  _AlertaViewState createState() =>
      _AlertaViewState(botonPreferences, alertservice);
}

class _AlertaViewState extends State<AlertaView> {
  final BotonPreferences _botonPreferences;
  final Alertservice _alertservice;
  _AlertaViewState(this._botonPreferences, this._alertservice) {
    this._botonPreferences.isBotonPresionado().then((isPressed) {
      if (!isPressed) {
        Navigator.pushNamed(context, '/');
      }
    });
  }

  @override
  void initState() {
    super.initState();
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
          margin: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
