import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class UpBit {
  static WebSocketChannel connectUpBit(
      {required String ticket,
      required String type,
      required List<String> codes}) {
    WebSocketChannel ws = WebSocketChannel.connect(
      Uri.parse('wss://api.upbit.com/websocket/v1'),
    );

    ws.sink.add(
      jsonEncode([
        {"ticket": ticket},
        {"type": type, "codes": codes},
      ]),
    );

    return ws;
  }
}
