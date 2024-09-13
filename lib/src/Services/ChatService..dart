import 'dart:async';

import 'package:boton_cosib/src/preferences/UserPreferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatService {
  ChatService({required this.url}) {
    if (!url.startsWith('ws://') && !url.startsWith('wss://')) {
      throw ArgumentError('URL must start with ws:// or wss://');
    }
  }
  UserPreferences userPreferences = UserPreferences();
  final String url;
  late WebSocketChannel _channel;
  Future<void> connect() async {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));

      ///envio el token de autenticacion
      String? bearerToken = await userPreferences.getBearerToken();
      _channel.sink.add("$bearerToken");
    } catch (e) {
      throw e;
    }
  }

  /// Envía un mensaje al servidor de chat.
  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  /// Escucha los mensajes recibidos del servidor.
  Stream<String> get messages =>
      _channel.stream.map((event) => event.toString());

  /// Cierra la conexión con el servidor de chat.
  void close() {
    _channel.sink.close();
  }
}
