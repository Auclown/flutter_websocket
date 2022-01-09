import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class Binance {
  static WebSocketChannel connectBinance(
      {required String method, required String code}) {
    WebSocketChannel ws = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws'),
    );

    ws.sink.add(jsonEncode({
      "method": method,
      "params": ["$code@aggTrade"],
      "id": 1
    }));

    return ws;
  }
}
