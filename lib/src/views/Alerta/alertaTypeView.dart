import 'dart:io';

import 'package:boton_cosib/src/Services/AlertService.dart';
import 'package:boton_cosib/src/model/alertType.dart';
import 'package:boton_cosib/src/preferences/BotonPreferences.dart';
import 'package:boton_cosib/src/views/Alerta/chatView.dart';
import 'package:cross_file/cross_file.dart' as cross_file;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class AlertaTypeView extends StatefulWidget {
  static const routeName = '/alerta-type';

  final BotonPreferences botonPreferences;
  final AlertService alertservice;

  const AlertaTypeView({
    Key? key,
    required this.botonPreferences,
    required this.alertservice,
  }) : super(key: key);

  @override
  _AlertaTypeViewState createState() =>
      _AlertaTypeViewState(alertservice: alertservice);
}

class _AlertaTypeViewState extends State<AlertaTypeView> {
  late final BotonPreferences _botonPreferences;
  AlertButtonType? _alertType;
  final ImagePicker _photoPicker = ImagePicker();
  final ImagePicker _videoPicker = ImagePicker();
  final List<Map<String, dynamic>> _media = [];
  String _responseText = "";
  final TextEditingController _responseController;
  bool _videoRecorded = false;
  bool _photoTaken = false;
  VideoPlayerController? _videoController;

  _AlertaTypeViewState({required AlertService alertservice})
      : _responseController = TextEditingController(),
        _alertservice = alertservice;

  final AlertService _alertservice;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      _botonPreferences = widget.botonPreferences;
      await _getAlertType();
      await _checkIfInUAM();
    } catch (e) {
      print('Error during initialization: $e');
    }
  }

  Future<void> _checkIfInUAM() async {
    bool isPressed = await _botonPreferences.isBotonPresionado();
    if (!isPressed) {
      Navigator.pushNamed(context, '/');
    } else {
      await _alertservice.isUAM();
      setState(() {});
    }
  }

  Future<void> _getAlertType() async {
    try {
      final type = await _botonPreferences.getTipoAlerta();
      if (mounted) {
        setState(() {
          _alertType = type;
        });
      }
    } catch (e) {
      print('Error retrieving alert type: $e');
      if (mounted) {
        setState(() {
          _alertType = null;
        });
      }
    }
  }

  Future<void> _takePhoto() async {
    if (_videoRecorded) {
      _showSnackBar('No se puede tomar una foto después de grabar un video');
      return;
    }

    try {
      print('Attempting to take a photo...');
      final XFile? photo =
          await _photoPicker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        if (mounted) {
          setState(() {
            _responseText = "Foto tomada: ${photo.name}";
            _responseController.text = _responseText;
            _media.add({'type': 'photo', 'data': File(photo.path)});
            _photoTaken = true;
          });
          _alertservice.sendAlertaFoto(cross_file.XFile(photo.path));
          print('Photo taken: ${photo.name}');
        }
      } else {
        print('No photo was taken.');
      }
    } catch (e) {
      print('Error taking photo: $e');
    }
  }

  Future<void> _recordVideo() async {
    if (_photoTaken) {
      _showSnackBar('No se puede grabar un video después de tomar una foto');
      return;
    }

    if (_videoRecorded) {
      _showSnackBar('Solo se puede mandar un video de máximo 3 minutos');
      return;
    }

    // Alert dialog for video recording
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Grabar Video'),
          content:
              const Text('Solo se puede mandar un video de máximo 3 minutos'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _record();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _record() async {
    try {
      final XFile? video = await _videoPicker.pickVideo(
        source: ImageSource.camera,
        maxDuration: const Duration(minutes: 3),
      );
      if (video != null) {
        final videoFile = File(video.path);
        _videoController = VideoPlayerController.file(videoFile);

        // Initialize video controller
        await _videoController!.initialize();
        if (mounted) {
          setState(() {
            _videoController!.play();
            _media.add({'type': 'video', 'data': _videoController});
            _responseText = "Video grabado: ${video.name}";
            _responseController.text = _responseText;
            _videoRecorded = true;
          });
          _alertservice.sendAlertaVideo(cross_file.XFile(video.path));
        }
      }
    } catch (e) {
      print('Error recording video: $e');
    }
  }

  Future<void> _sendLocation() async {
    final TextEditingController locationController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Especifica tu Ubicación'),
          content: TextField(
            controller: locationController,
            decoration: const InputDecoration(
              labelText: 'Ubicación',
              hintText: 'Ingresa tu ubicación',
            ),
            maxLines: 3,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                try {
                  if (mounted) {
                    setState(() {
                      _responseText =
                          "Ubicación enviada: ${locationController.text}";
                      _responseController.text = _responseText;
                      _media.add({'type': 'text', 'data': _responseText});
                      _alertservice.enviarUbicacion(locationController.text);
                    });
                    print(
                        'Ubicación actualizada a: ${locationController.text}');
                  }
                } catch (e) {
                  print('Error sending location: $e');
                }
              },
              child: const Text('Enviar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _sendMoreInfo() async {
    final TextEditingController infoController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enviar Más Información'),
          content: TextField(
            controller: infoController,
            decoration: const InputDecoration(
              labelText: 'Información Adicional',
              hintText: 'Ingresa más información',
            ),
            maxLines: 3,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                try {
                  if (mounted) {
                    setState(() {
                      _responseText =
                          "Información enviada: ${infoController.text}";
                      _responseController.text = _responseText;
                      _alertservice.sendMoreInfo(infoController.text);
                      _media.add({'type': 'text', 'data': _responseText});
                    });
                    print('Información enviada: ${infoController.text}');
                  }
                } catch (e) {
                  print('Error sending information: $e');
                }
              },
              child: const Text('Enviar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void _openChat() {
    try {
      Navigator.pushNamed(context, ChatView.routeName);
    } catch (e) {
      print('Error opening chat: $e');
    }
  }

  void _replayVideo(VideoPlayerController controller) {
    try {
      if (controller.value.isInitialized) {
        controller.seekTo(Duration.zero);
        controller.play();
      } else {
        print('The video controller has been disposed or is not initialized.');
      }
    } catch (e) {
      print('Error replaying video: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: AppBar(
          title: Text('Alerta: ${_alertType?.label ?? "Externa"}'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 46, 42, 46),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'Tu Alerta ha sido enviada. Por favor, si tienes más información intégrala.',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 247, 247, 247)),
                ),
              ),
              const SizedBox(height: 16),
              _buildButton('Tomar Foto', _takePhoto, enabled: !_videoRecorded),
              const SizedBox(height: 16),
              _buildButton('Grabar Video', _recordVideo,
                  enabled: !_photoTaken && !_videoRecorded),
              const SizedBox(height: 16),
              _buildButton('Especificar la Ubicación', _sendLocation),
              const SizedBox(height: 16),
              _buildButton('Abrir Chat', _openChat),
              const SizedBox(height: 16),
              _buildButton('Enviar Más Información', _sendMoreInfo),
              const SizedBox(height: 16),
              _buildMediaSection(),
            ],
          ),
        ),
      );
    } catch (e) {
      print('Error building view: $e');
      return Scaffold(
        body: Center(
          child: Text('Error loading view'),
        ),
      );
    }
  }

  Widget _buildButton(String text, VoidCallback onPressed,
      {bool enabled = true}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        textStyle: const TextStyle(fontSize: 20),
        minimumSize:
            Size(double.infinity, 50), // Ensures all buttons are the same size
      ),
      onPressed: enabled ? onPressed : null,
      child: Text(text),
    );
  }

  Widget _buildMediaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Elementos Enviados',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 106, 103, 106),
          ),
        ),
        const SizedBox(height: 8),
        _buildMediaList(),
      ],
    );
  }

  Widget _buildMediaList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _media.length,
      itemBuilder: (context, index) {
        final media = _media[index];
        return ListTile(
          title: Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 11, 106, 73),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: _buildMediaContent(media),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMediaContent(Map<String, dynamic> media) {
    switch (media['type']) {
      case 'photo':
        return Image.file(media['data']);
      case 'video':
        final controller = media['data'] as VideoPlayerController;
        return Column(
          children: [
            Container(
              height: 200,
              child: VideoPlayer(controller),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _replayVideo(controller),
                    child: const Text('Repetir Video'),
                  ),
                ),
              ],
            ),
          ],
        );
      case 'text':
      default:
        return Text(media['data'],
            style: const TextStyle(fontSize: 16, color: Colors.white));
    }
  }

  @override
  void dispose() {
    try {
      for (var media in _media) {
        if (media['type'] == 'video') {
          final controller = media['data'] as VideoPlayerController;
          if (controller.value.isInitialized) {
            controller.dispose();
          }
        }
      }
      _responseController.dispose();

      super.dispose();
    } catch (e) {
      print('Error during disposal: $e');
    }
  }
}
