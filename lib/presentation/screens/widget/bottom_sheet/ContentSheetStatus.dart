import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoice_system/core/routes/app_router.dart';
import 'package:invoice_system/core/routes/named_router.dart';
import 'package:invoice_system/core/services/services_locator.dart';
import 'package:invoice_system/presentation/controller/invoice_bloc/invoice_bloc.dart';
import 'package:invoice_system/presentation/screens/shared_widget/custom_button.dart';
import 'package:invoice_system/utils/appConst.dart';
import 'package:invoice_system/utils/helper.dart';

import '../../../controller/invoice_details_bloc/invoice_details_bloc.dart';
import '../../invoice_flow/ShowDetailsInvoiceScreen.dart';

class ContentSheetStatus extends StatelessWidget {
  const ContentSheetStatus({
    Key? key,
    required this.id,
    required this.status,
    required this.time,
    required this.title,
    required this.subTitle,
    required this.subTotal,
  }) : super(key: key);

  final String id, status, time, title, subTitle, subTotal;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) =>
          getIt<InvoiceDetailsBloc>()..add(InvoiceDetailsEvent(id: id)),
      child: BottomSheetBodyWidget(
        id: id,
        status: status,
        time: time,
        title: title,
        subTitle: subTitle,
        subTotal: subTotal,
      ),
    );
  }
}

class BottomSheetBodyWidget extends StatelessWidget {
  const BottomSheetBodyWidget(
      {Key? key,
      required this.id,
      required this.status,
      required this.time,
      required this.title,
      required this.subTitle,
      required this.subTotal})
      : super(key: key);
  final String id, status, time, title, subTitle, subTotal;

  @override
  Widget build(BuildContext context) {
    var midea = MediaQuery.of(context).size;
    return BlocBuilder<InvoiceDetailsBloc, InvoiceDetailsState>(
      builder: (context, state) {
        var data = state.invoiceDetailsModel;
        // print("Bottom ID :$id");

        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingHorizontal, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: midea.width * 0.3),
                height: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: const Color(AppColor.gray),
                ),
              ),
              StatusWidget(
                data: data,
                status: status,
                time: time,
              ),
              BottomSheetHeaderItem(
                title: title,
                subtitle: subTitle,
                price: subTotal,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 180,
                    child: Text(
                      data.fixed?.first.itemName.toString() ?? title,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 1,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Sub Total',
                                style: TextStyle(
                                    fontSize: AppSizes.textTiny,
                                    color: Color(AppColor.gray)),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Fees',
                                style: TextStyle(
                                    fontSize: AppSizes.textTiny,
                                    color: Color(AppColor.gray)),
                              ),
                              Divider(),
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: AppSizes.textDefaultSize,
                                    color: Color(AppColor.gray)),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\$ ${data.subTotal ?? subTotal}',
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '\$ ${data.ourFee ?? 0.0} ',
                                style: const TextStyle(
                                    color: Color(AppColor.gray)),
                              ),
                              const Divider(),
                              Text(
                                '\$ ${data.subTotal ?? subTotal}',
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    isBorder: true,
                    title: 'Show more',
                    textColor: AppColor.primaryButtonColor,
                    textColorIsWhite: false,
                    onPressed: () {
                      AppRouter.navigatorKey.currentState!.pushNamed(
                        ScreenName.showDetailsInvoiceScreen,
                        arguments: data.sId ?? id,
                      );
                    },
                    width: 160,
                  ),
                  CustomButton(
                    isBorder: true,
                    title: 'Edit',
                    textColor: AppColor.primaryButtonColor,
                    textColorIsWhite: false,
                    onPressed: () {
                      // AppRouter.navigatorKey.currentState!.pushNamed(
                      //   ScreenName.showDetailsInvoiceScreen,
                      //   arguments: data.sId ?? id,
                      // );
                    },
                    width: 160,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomSheetHeaderItem extends StatelessWidget {
  const BottomSheetHeaderItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  final String title, subtitle, price;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 1,
      itemBuilder: (context, index) => ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: AppSizes.textSemiLarge,
            color: Color(AppColor.primaryTextColor),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: AppSizes.textTiny,
            color: Color(AppColor.gray),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$$price',
              style: const TextStyle(
                fontSize: AppSizes.textSemiLarge,
                color: Color(AppColor.primaryTextColor),
              ),
            ),
            const Text('')
          ],
        ),
      ),
    );
  }
}

class StatusWidget extends StatelessWidget {
  StatusWidget(
      {Key? key, required this.data, required this.status, required this.time})
      : super(key: key);

  dynamic data;

  final String status, time;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 18,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: Helper.setIcon(status),
      title: Text(
        data.status?.toString() ?? status,
        style: TextStyle(
          fontSize: AppSizes.textSemiLarge,
          fontWeight: FontWeight.w600,
          color: Helper.setColor(status),
        ),
      ),
      subtitle: Text(
        data.createdAt != null
            ? Helper.formatTime(data.createdAt.toString())
            : time,
        style: const TextStyle(
          fontSize: AppSizes.textTiny,
          color: Color(AppColor.gray),
        ),
      ),
      trailing: Text(
        data.createdAt != null
            ? Helper.formatTime(data.createdAt.toString())
            : time,
        style: const TextStyle(
          fontSize: AppSizes.textTiny,
          color: Color(AppColor.gray),
        ),
      ),
    );
  }
}
