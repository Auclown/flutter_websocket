import 'package:flutter/cupertino.dart';

import '/screens/home/widgets/price_tag.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PriceTag(),
          ],
        ),
      ),
    );
  }
}
