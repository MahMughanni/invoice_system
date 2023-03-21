import 'package:flutter/material.dart';
import 'package:invoice_system/presentation/screens/shared/main_container.dart';
import 'package:invoice_system/presentation/screens/widget/header_widget.dart';
import 'package:invoice_system/presentation/screens/widget/transactions_list_widget.dart';
import 'package:invoice_system/utils/ImageManger.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text('Hello , Mahmoud'),
            ),
            const HeaderWidget(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Transactions'),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All ',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            const TransactionsListWidget(),
          ],
        ),
      ),
    );
  }
}
