import 'package:flutter/material.dart';
import 'package:invoice_system/utils/helper.dart';

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
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              data ?? '',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.w700 ,fontSize: 16),
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  jobTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
                Text('\$ $price'),
              ],
            ),
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
                style: TextStyle(color: Helper.setColor(status)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
