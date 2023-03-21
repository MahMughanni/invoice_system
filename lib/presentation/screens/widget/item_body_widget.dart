import 'package:flutter/material.dart';

class TransactionsItemBody extends StatelessWidget {
  const TransactionsItemBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('UI/UX Design for Talents Valley LLC'),
              Text('\$450'),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Omar Ziara'),
              Text('Pending Approval'),
            ],
          ),
        ],
      ),
    );
  }
}
