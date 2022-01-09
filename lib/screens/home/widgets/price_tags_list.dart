import 'package:flutter/cupertino.dart';
import 'package:websocket/screens/home/widgets/price_tag.dart';

class PriceTagsList extends StatelessWidget {
  const PriceTagsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        PriceTag(
          provider: "Binance",
        ),
        PriceTag(
          provider: "UpBit",
        ),
      ],
    );
  }
}
