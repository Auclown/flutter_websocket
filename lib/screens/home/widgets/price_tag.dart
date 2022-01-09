import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:websocket/services/websocket/binance.dart';
import 'package:websocket/services/websocket/upbit.dart';

class PriceTag extends StatefulWidget {
  final String provider;
  const PriceTag({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  _PriceTagState createState() => _PriceTagState();
}

class _PriceTagState extends State<PriceTag> {
  late WebSocketChannel ws;
  String price = '';

  @override
  void initState() {
    super.initState();
    widget.provider == "Binance" ? binance() : upBit();
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
            Text(widget.provider == "Binance" ? "BTC-USDT" : "BTC-KRW"),
            Text(price),
          ],
        ),
      ),
    );
  }

  void binance() {
    ws = Binance.connectBinance(method: "SUBSCRIBE", code: "btcusdt");
    ws.stream.listen(
      (data) {
        setState(() {
          price = jsonDecode(data)['p'];
        });
      },
      onError: (error) => print(error),
    );
  }

  void upBit() {
    ws = UpBit.connectUpBit(
      ticket: "UNIQUE_TICKET",
      type: "trade",
      codes: ["KRW-BTC"],
    );
    ws.stream.listen(
      (data) {
        setState(() {
          price = jsonDecode(
            utf8.decode(data),
          )['trade_price']
              .toString();
        });
      },
    );
  }
}
