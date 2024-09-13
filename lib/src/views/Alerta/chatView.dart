import 'dart:async';

import 'package:boton_cosib/src/Services/ChatService.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  ChatView({super.key, required this.chatService});
  final ChatService chatService;
  static const routeName = '/chat';
  @override
  _ChatViewState createState() => _ChatViewState(chatService);
}

class _ChatViewState extends State<ChatView> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService;
  late StreamSubscription<String> _messageSubscription;

  _ChatViewState(this._chatService);

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  Future<void> _initializeChat() async {
    try {
      await _chatService.connect();

      // Escucha los mensajes entrantes del WebSocket
      _messageSubscription = _chatService.messages.listen((message) {
        setState(() {
          _messages.add({
            'text': message,
            'sender': 'bot', // Los mensajes recibidos son del servidor (bot)
          });
        });
      });
    } catch (e) {
      // Maneja errores de conexión
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al conectarse al chat: $e'),
        ),
      );
    }
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _messageController.text,
          'sender': 'user', // Los mensajes enviados son del usuario
        });
      });

      // Envía el mensaje al servidor a través del WebSocket
      widget.chatService.sendMessage(_messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUserMessage = message['sender'] == 'user';
                return _buildMessageBubble(
                  message['text']!,
                  isUserMessage,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Escribe un mensaje...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String message, bool isUserMessage) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: isUserMessage
                ? const Radius.circular(20)
                : const Radius.circular(0),
            bottomRight: isUserMessage
                ? const Radius.circular(0)
                : const Radius.circular(20),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUserMessage ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageSubscription
        .cancel(); // Detener la escucha de mensajes del WebSocket
    _messageController.dispose();
    _chatService.close(); // Cerrar la conexión al WebSocket
    super.dispose();
  }
}
