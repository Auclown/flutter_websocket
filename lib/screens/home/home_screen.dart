import 'package:flutter/cupertino.dart';

import '/screens/home/widgets/price_tags_list.dart';

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
