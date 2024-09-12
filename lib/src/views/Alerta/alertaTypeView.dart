import 'dart:io';

import 'package:boton_cosib/src/model/alertType.dart';
import 'package:boton_cosib/src/preferences/BotonPreferences.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class AlertaTypeView extends StatefulWidget {
  static const routeName = '/alerta-type';

  final BotonPreferences botonPreferences;

  const AlertaTypeView({
    Key? key,
    required this.botonPreferences,
  }) : super(key: key);

  @override
  _AlertaTypeViewState createState() => _AlertaTypeViewState();
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

  _AlertaTypeViewState() : _responseController = TextEditingController();

  @override
  void initState() {
    super.initState();
    try {
      _botonPreferences = widget.botonPreferences;
      _getAlertType();
    } catch (e) {
      print('Error in initState: $e');
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
      print('Error al obtener el tipo de alerta: $e');
      if (mounted) {
        setState(() {
          _alertType = null;
        });
      }
    }
  }

  Future<void> _takePhoto() async {
    try {
      print('Intentando tomar una foto...');
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
          print('Foto tomada: ${photo.name}');
        }
      } else {
        print('No se tomó ninguna foto.');
      }
    } catch (e) {
      print('Error al tomar la foto: $e');
    }
  }

  Future<void> _recordVideo() async {
    if (_videoRecorded) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Solo se puede mandar un video de maximo 3 minutos')),
      );
      return;
    }

    //mando alerta de que solo se puede mandar un video de 3 minutos
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Grabar Video'),
          content:
              const Text('Solo se puede mandar un video de maximo 3 minutos'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _grabar();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _grabar() async {
    try {
      final XFile? video = await _videoPicker.pickVideo(
        source: ImageSource.camera,
        maxDuration: const Duration(minutes: 3),
      );
      if (video != null) {
        final videoFile = File(video.path);
        _videoController = VideoPlayerController.file(videoFile);

        // Inicialización del controlador de video
        await _videoController!.initialize();
        if (mounted) {
          setState(() {
            _videoController!.play();
            _media.add({'type': 'video', 'data': _videoController});
            _responseText = "Video grabado: ${video.name}";
            _responseController.text = _responseText;
            _videoRecorded = true;
          });
        }
      }
    } catch (e) {
      print('Error al grabar el video: $e');
    }
  }

  Future<void> _saveVideoToDevice(VideoPlayerController controller) async {
    try {
      final directory = await getExternalStorageDirectory();
      final path = '${directory?.path}';
      final filePath = '$path/${DateTime.now().millisecondsSinceEpoch}.mp4';

      // Asegurarse de que el directorio exista
      final dir = Directory(path);
      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }

      final file = File(controller.dataSource);
      await file.copy(filePath);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Video guardado en: $filePath')),
      );
    } catch (e) {
      print('Error al guardar el video: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar el video')),
      );
    }
  }

  Future<void> _sendLocation() async {
    try {
      final TextEditingController locationController = TextEditingController();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Enviar Ubicación'),
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
                      });
                      print('Ubicación enviada: ${locationController.text}');
                    }
                  } catch (e) {
                    print('Error al enviar la ubicación: $e');
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
    } catch (e) {
      print('Error in _sendLocation: $e');
    }
  }

  void _replayVideo(VideoPlayerController controller) {
    try {
      if (controller.value.isInitialized) {
        controller.seekTo(Duration.zero);
        controller.play();
      }
    } catch (e) {
      print('Error in _replayVideo: $e');
    }
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
              _buildButton('Tomar Foto', _takePhoto),
              const SizedBox(height: 16),
              _buildButton('Grabar Video', _recordVideo,
                  enabled: !_videoRecorded),
              const SizedBox(height: 16),
              _buildButton('Enviar mi Ubicación', _sendLocation),
              const SizedBox(height: 16),
              _buildMediaList(),
            ],
          ),
        ),
      );
    } catch (e) {
      print('Error in build: $e');
      return Scaffold(
        body: Center(
          child: Text('Error loading view'),
        ),
      );
    }
  }

  Widget _buildButton(String text, VoidCallback onPressed,
      {bool enabled = true}) {
    try {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: enabled ? onPressed : null,
        child: Text(text),
      );
    } catch (e) {
      print('Error in _buildButton: $e');
      return ElevatedButton(
        onPressed: null,
        child: Text('Error'),
      );
    }
  }

  Widget _buildMediaList() {
    try {
      return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _media.length,
          itemBuilder: (context, index) {
            final media = _media[index];
            return ListTile(
              title: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: _buildMediaContent(media),
                ),
              ),
            );
          },
        ),
      );
    } catch (e) {
      print('Error in _buildMediaList: $e');
      return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text('Error loading media list'),
        ),
      );
    }
  }

  Widget _buildMediaContent(Map<String, dynamic> media) {
    try {
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
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _saveVideoToDevice(controller),
                      child: const Text('Guardar en mi dispositivo'),
                    ),
                  ),
                ],
              ),
            ],
          );
        case 'text':
        default:
          return Text(media['data']);
      }
    } catch (e) {
      print('Error in _buildMediaContent: $e');
      return Text('Error loading media content');
    }
  }

  @override
  void dispose() {
    try {
      _responseController.dispose();
      _videoController?.dispose();
      for (var media in _media) {
        if (media['type'] == 'video') {
          final controller = media['data'] as VideoPlayerController;
          if (controller.value.isInitialized) {
            controller.dispose();
          }
        }
      }
      super.dispose();
    } catch (e) {
      print('Error in dispose: $e');
    }
  }
}
