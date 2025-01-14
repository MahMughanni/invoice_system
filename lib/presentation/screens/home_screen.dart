import 'package:flutter/material.dart';
import 'package:invoice_system/core/services/services_locator.dart';
import 'package:invoice_system/presentation/controller/invoice_bloc/invoice_bloc.dart';
import 'package:invoice_system/presentation/screens/widget/header_widget.dart';
import 'package:invoice_system/presentation/screens/widget/transactions_list_widget.dart';
import 'package:invoice_system/utils/appConst.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/localData/shared_perf.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: BlocProvider(
        create: (context) => getIt<InvoiceBloc>()
          ..add(GetInvoiceEvent(SharedPrefController().getUser().accessToken)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 32.0),
                //   child: Text(
                //       'Hello , ${SharedPrefController().getUser().userInfo.firstName}'),
                // ),
                HeaderWidget(
                  balance: SharedPrefController()
                      .getUser()
                      .userInfo
                      .balance
                      .toStringAsFixed(2),
                ),
                Row(
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
                const TransactionsListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
