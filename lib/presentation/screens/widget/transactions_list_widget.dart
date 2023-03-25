import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:invoice_system/core/routes/app_router.dart';
import 'package:invoice_system/core/routes/named_router.dart';
import 'package:invoice_system/presentation/controller/invoice_bloc/invoice_bloc.dart';
import 'package:invoice_system/utils/extentions/date_ext.dart';
import 'package:invoice_system/utils/helper.dart';

import '../shared_widget/main_container.dart';
import 'item_body_widget.dart';

class TransactionsListWidget extends StatelessWidget {
  const TransactionsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<InvoiceBloc, InvoiceSeccsuesState>(
      builder: (context, state) {
        var data = state.invoiceList;
        return MainContainer(
            height: height * .50,
            width: double.infinity,
            paddingTop: 0,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                bool isSameDate = true;
                var data = state.invoiceList[index];
                var listData = state.invoiceList;
                var fixed = data.fixed;
                DateTime createdDate = DateTime.parse(data.createdAt);
                String formattedDate =
                    DateFormat.yMMMMEEEEd().format(createdDate);

                if (index == 0) {
                  isSameDate = false;
                } else {
                  final String prevDateString = listData[index - 1].createdAt;
                  final DateTime prevDate = DateTime.parse(prevDateString);
                  isSameDate = createdDate.isSameDate(prevDate);
                }
                if (index == 0 || !(isSameDate)) {
                  return GestureDetector(
                    onTap: () {
                      AppRouter.navigatorKey.currentState!.pushNamed(
                          ScreenName.previewScreen,
                          arguments: state.invoiceList[index].id.toString());
                    },
                    child: TransactionsItemBody(
                      jobTitle: fixed.first.itemName ?? '',
                      clintName: data.client.firstName,
                      price: fixed.first.price.toString(),
                      status: data.status.toString(),
                      color: Helper.setColor(data),
                      data: calculateDifference(createdDate) == -1
                          ? 'Yesterday'
                          : calculateDifference(createdDate) == 0
                              ? 'Today'
                              : formattedDate.toString(),
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      AppRouter.navigatorKey.currentState!.pushNamed(
                          ScreenName.detailsScreen,
                          arguments: state.invoiceList[index].id.toString());
                    },
                    child: TransactionsItemBody(
                      jobTitle: fixed.first.itemName ?? '',
                      clintName: data.client.firstName,
                      price: fixed.first.price.toString(),
                      status: data.status.toString(),
                      color: Helper.setColor(data),
                    ),
                  );
                }
              },
            ));
      },
    );
  }

  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }
}
