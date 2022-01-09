import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:web_socket_channel/web_socket_channel.dart';

class PriceTag extends StatefulWidget {
  const PriceTag({Key? key}) : super(key: key);

  @override
  _PriceTagState createState() => _PriceTagState();
}

class _PriceTagState extends State<PriceTag> {
  late WebSocketChannel ws;
  String price = '';

  @override
  void initState() {
    super.initState();
    ws = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws'),
    );

    ws.sink.add(
      jsonEncode(
        {
          "method": "SUBSCRIBE",
          "params": ["btcusdt@aggTrade"],
          "id": 1
        },
      ),
    );

    ws.stream.listen(
      (data) {
        setState(() {
          price = jsonDecode(data)['p'];
        });
      },
      onError: (error) => print(error),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey.shade200),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Current BTC Price'),
            Text(price),
          ],
        ),
      ),
    );
  }
}
