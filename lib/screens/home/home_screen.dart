import 'package:flutter/cupertino.dart';
import 'package:websocket/screens/home/widgets/price_tags_list.dart';

import '/screens/home/widgets/price_tag.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: SafeArea(
        child: PriceTagsList(),
      ),
    );
  }
}
