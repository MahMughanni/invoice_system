import 'package:flutter/material.dart';
import 'package:invoice_system/utils/appConst.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data ?? '',
          textAlign: TextAlign.left,
          style: const TextStyle(color: Color(AppColor.gray)),
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Row(
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
        const SizedBox(height: 8),
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
    );
  }
}
