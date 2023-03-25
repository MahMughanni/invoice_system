import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:invoice_system/core/routes/app_router.dart';
import 'package:invoice_system/core/routes/named_router.dart';
import 'package:invoice_system/presentation/controller/invoice_details_bloc/invoice_details_bloc.dart';
import 'package:invoice_system/presentation/screens/widget/shared_appbar.dart';
import 'package:invoice_system/utils/appConst.dart';
import 'package:invoice_system/utils/helper.dart';

import '../../../core/services/services_locator.dart';
import '../shared_widget/custom_button.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  const InvoiceDetailsScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    print(" ID :${id.toString()}");
    return BlocProvider(
      create: (context) => getIt<InvoiceDetailsBloc>()
        ..add(
          InvoiceDetailsEvent(id: id.toString()),
        ),
      child: Scaffold(
        appBar: SharedAppBar(title: 'Invoice Invoice', isBack: true),
        body: const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.paddingHorizontal,
              vertical: AppSizes.paddingVertival),
          child: Center(child: PreviewCardBody()),
        ),
      ),
    );
  }
}

class PreviewScreenBody extends StatelessWidget {
  const PreviewScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceDetailsBloc, InvoiceDetailsState>(
      builder: (context, state) {
        // print(state.invoiceDetailsModel.);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              title: 'Send Invoice',
              textColorIsWhite: true,
              onPressed: () {
                AppRouter.goTo(screenName: ScreenName.invoiceListTabsScreen);
                UtilsConfig.showSnackBarMessage(
                    message: 'Your invoice is now under review.',
                    status: false);
              },
              isBorder: false,
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: 'Edit',
              isBorder: true,
              textColorIsWhite: false,
              onPressed: () {},
              textColor: (AppColor.primaryButtonColor),
            ),
          ],
        );
      },
    );
  }
}

class PreviewCardBody extends StatelessWidget {
  const PreviewCardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(AppColor.white),
          borderRadius: BorderRadius.circular(7),
        ),
        child: const ContentInPreviewCard());
  }
}

class ContentInPreviewCard extends StatelessWidget {
  const ContentInPreviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceDetailsBloc, InvoiceDetailsState>(
      builder: (context, state) {
        var data = state.invoiceDetailsModel;

        var time = data.createdAt;
        DateTime createdDate =
            DateTime.parse(time ?? '2023-03-21T01:15:06.133Z');
        String formattedDate = DateFormat.yMMMd().format(createdDate);
        // print(data);
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Text(
                'Invoice',
                style: TextStyle(
                    fontSize: AppSizes.textSemiLarge,
                    fontWeight: FontWeight.bold),
              ),
              title: Text(
                '#${data.invoiceNo.toString()}',
                style: const TextStyle(fontSize: AppSizes.textVerySmall),
              ),
              trailing: SizedBox(
                  width: 50,
                  height: 20,
                  child: Image.asset(ImageManger.logoImage)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'From',
                      style: TextStyle(
                          fontSize: AppSizes.textTiny,
                          color: Color(AppColor.gray)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      data.client?.fullName.toString() ?? 'Talents Valley',
                      style: const TextStyle(
                        color: Color(AppColor.primaryTextColor),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'LLC 30 North Gould St.\nSheridan, Wyoming 82801\n${data.client?.address.country ?? ''}\n+1 307-217-6666',
                      style: const TextStyle(
                          fontSize: AppSizes.textTiny,
                          color: Color(AppColor.gray)),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bill To',
                      style: TextStyle(
                          fontSize: AppSizes.textTiny,
                          color: Color(AppColor.gray)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      data.freelancer?.firstName ?? '',
                      style: const TextStyle(
                        color: Color(AppColor.primaryTextColor),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      data.freelancer?.email ?? '',
                      style: const TextStyle(
                          fontSize: AppSizes.textTiny,
                          color: Color(AppColor.gray)),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Issue Date',
                      style: TextStyle(
                          fontSize: AppSizes.textTiny,
                          color: Color(AppColor.gray)),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      formattedDate.toString(),
                      style: const TextStyle(
                        color: Color(AppColor.primaryTextColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Service',
                style: TextStyle(
                    fontSize: AppSizes.textTiny, color: Color(AppColor.gray)),
              ),
              trailing: Text(
                'Amount',
                style: TextStyle(
                    fontSize: AppSizes.textTiny, color: Color(AppColor.gray)),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.fixed?.length ?? 2,
              itemBuilder: (context, index) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  data.fixed?[index].itemName ?? '',
                  style:
                      const TextStyle(color: Color(AppColor.primaryTextColor)),
                ),
                trailing: Text(
                  '\$ ${data.fixed?[index].price ?? '00.00'}',
                  style: const TextStyle(
                      fontSize: AppSizes.textTiny, color: Color(AppColor.gray)),
                ),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(''),
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
                              '\$ ${data.subTotal?.toString() ?? '00.00'}',
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '\$ ${data.ourFee?.toString() ?? '..'}',
                              style:
                                  const TextStyle(color: Color(AppColor.gray)),
                            ),
                            const Divider(),
                            Text(
                              '\$ ${totalFees(data.subTotal?.toDouble() ?? 0.0, data.ourFee?.toDouble() ?? 0.0).toString()}',
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  double totalFees(subtotal, fee) {
    var totalFee = subtotal - (subtotal - fee);
    return subtotal - totalFee;
  }
}
