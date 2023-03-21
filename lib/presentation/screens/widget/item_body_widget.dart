import 'package:flutter/material.dart';

class TransactionsItemBody extends StatelessWidget {
  const TransactionsItemBody(
      {Key? key,
      required this.jobTitle,
      required this.clintName,
      required this.price,
      required this.status,
      this.data,
      required this.color})
      : super(key: key);

  final String jobTitle, clintName, price, status;

  final Color color;
  final String? data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data ?? ''),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(jobTitle),
              Text('\$ $price'),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(clintName),
              Text(
                status,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
