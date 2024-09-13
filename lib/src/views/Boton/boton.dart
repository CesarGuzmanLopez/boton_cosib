import 'dart:async';

import 'package:boton_cosib/src/Services/AlertService.dart';
import 'package:boton_cosib/src/Services/ChatService.dart';
import 'package:boton_cosib/src/menu/AppDrawer.dart';
import 'package:boton_cosib/src/preferences/BotonPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

class BotonView extends StatefulWidget {
  static const routeName = '/';

  const BotonView({
    Key? key,
    required this.botonPreferences,
    required this.alertservice,
    required ChatService chatService,
  })  : _chatService = chatService,
        super(key: key);

  final BotonPreferences botonPreferences;
  final AlertService alertservice;
  final ChatService _chatService;

  @override
  _BotonViewState createState() => _BotonViewState();
}

class _BotonViewState extends State<BotonView> {
  static const int initTimer = 3;
  late final int inactivityDuration;
  late final BotonPreferences _botonPreferences;
  late final AlertService _alertservice;
  late final ChatService _chatService;

  int _start = initTimer;
  Timer? _timer;
  Timer? _inactivityTimer;
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _botonPreferences = widget.botonPreferences;
    _alertservice = widget.alertservice;
    _chatService = widget._chatService;
    _checkInitialButtonState();

    inactivityDuration =
        int.parse(dotenv.env['TIEMPO_CHECAR_CONEXION_MILISEGUNDOS'] ?? '1500');
    print('Inactivity duration: $inactivityDuration');

    _checkInternetConnection();
    _inactivityTimer = Timer.periodic(
      Duration(milliseconds: inactivityDuration),
      (_) => _checkInternetConnection(),
    );
  }

  Future<void> _checkInternetConnection() async {
    _isConnected = await _alertservice.verificarConexion().then((value) {
      return value;
    }).catchError((e) {
      return false;
    });

    if (mounted) setState(() {});
  }

  Future<void> _checkInitialButtonState() async {
    if (await _botonPreferences.isBotonPresionado()) {
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
        if (mounted) setState(() => _start--);
      }
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    if (mounted) setState(() => _start = initTimer);
  }

  void _handleTap() {
    if (_isConnected) {
      if (_start > 0) {
        if (mounted) setState(() => _start--);
        if (_start == 0) _sendAlert();
      }
      _resetInactivityTimer();
    } else {
      _callEmergencyNumber();
    }
  }

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(
      Duration(milliseconds: inactivityDuration),
      () {
        if (mounted) setState(() => _start = initTimer);
      },
    );
  }

  Future<void> _sendAlert() async {
    if (await _alertservice.verificarConexion()) {
      try {
        // Mostrar el spinner
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        await _alertservice.enviarAlerta();
        Navigator.of(context).pop(); // Cerrar el spinner

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Alerta enviada correctamente')),
        );
        Navigator.pushNamed(context, '/alerta');
      } catch (e) {
        Navigator.of(context).pop(); // Cerrar el spinner en caso de error
        _showErrorDialog(
          'Error al enviar la alerta',
          'Error: no se pudo enviar la alerta, error servidor.',
          isEmergency: true,
        );
        Navigator.pushNamed(context, '/');
      }
      try {
        await _chatService.connect();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Error al conectar con el servidor de chat: $e')),
        );
      }
    } else {
      _showErrorDialog(
        'No hay conexión a internet o al servidor',
        'No se pudo enviar la alerta, llama al 911.',
        isEmergency: true,
      );
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
                if (isEmergency) _callEmergencyNumber();
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/logo1.png',
              width: 40,
              height: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/logo2.png',
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: DrawerHeader(
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
                            'assets/logo2.png',
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
          ),
          Container(
            child: Center(
              child: _buildEmergencyButton(),
            ),
          ),
        ],
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
                    color: Colors.redAccent,
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
