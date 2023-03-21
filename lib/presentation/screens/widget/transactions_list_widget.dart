import 'package:flutter/material.dart';
import 'package:invoice_system/presentation/screens/shared/main_container.dart';

import 'item_body_widget.dart';

class TransactionsListWidget extends StatelessWidget {
  const TransactionsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return MainContainer(
        height: height * .6,
        width: double.infinity,
        paddingTop: 0,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return const TransactionsItemBody();
          },
        ));
  }
}
