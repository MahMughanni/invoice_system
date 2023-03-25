import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:invoice_system/core/routes/app_router.dart';
import 'package:invoice_system/core/routes/named_router.dart';
import 'package:invoice_system/presentation/controller/create_invoice_bloc/create_invoice_bloc.dart';
import 'package:invoice_system/presentation/controller/localData/shared_perf.dart';
import 'package:invoice_system/presentation/screens/widget/shared_appbar.dart';
import 'package:invoice_system/utils/appConst.dart';
import 'package:invoice_system/utils/helper.dart';

import '../../../core/services/services_locator.dart';
import '../../../domain/entities/create_invoice_entities.dart';
import '../shared_widget/custom_button.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({Key? key, required this.createInvoiceEntities})
      : super(key: key);
  final CreateInvoiceEntities createInvoiceEntities;

  @override
  Widget build(BuildContext context) {
    print(" ID :${createInvoiceEntities.id.toString()}");
    return BlocProvider(
      create: (context) => getIt<CreateInvoiceBloc>(),
      child: Scaffold(
        appBar: SharedAppBar(title: 'Preview Invoice', isBack: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingHorizontal,
              vertical: AppSizes.paddingVertival),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(AppColor.white),
                borderRadius: BorderRadius.circular(7),
              ),
              child: ContentInPreviewCard(
                createInvoiceEntities: createInvoiceEntities,
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingHorizontal),
          child: PreviewScreenBody(
            createInvoiceEntities: createInvoiceEntities,
          ),
        ),
      ),
    );
  }
}

class PreviewScreenBody extends StatelessWidget {
  const PreviewScreenBody({Key? key, required this.createInvoiceEntities})
      : super(key: key);
  final CreateInvoiceEntities createInvoiceEntities;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateInvoiceBloc, CreateInvoiceSuccess>(
      builder: (context, state) {
        // print(state.invoiceDetailsModel.client);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              title: 'Send Invoice',
              textColorIsWhite: true,
              onPressed: () {
                BlocProvider.of<CreateInvoiceBloc>(context).add(
                  CreateInvoiceEvent(
                      createInvoiceEntities: createInvoiceEntities,
                      currency: 'USD',
                      token: SharedPrefController().getUser().accessToken),
                );

                Future.delayed(const Duration(microseconds: 500), () {
                  AppRouter.goToAndRemove(
                      screenName: ScreenName.invoiceListTabsScreen);
                });
                UtilsConfig.showSnackBarMessage(
                    message: 'Your invoice is now under review.', status: true);
              },
              isBorder: false,
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: 'Edit',
              isBorder: true,
              textColorIsWhite: false,
              onPressed: () {
                AppRouter.back();
              },
              textColor: (AppColor.primaryButtonColor),
            ),
          ],
        );
      },
    );
  }
}

class ContentInPreviewCard extends StatelessWidget {
  ContentInPreviewCard({
    super.key,
    required this.createInvoiceEntities,
  });

  final CreateInvoiceEntities createInvoiceEntities;

  // List<dynamic> fixed = [];

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    String formattedDate = DateFormat.yMMMd().format(time);
    // print(data);
    return ListView(
      //  physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Text(
            'Invoice',
            style: TextStyle(
                fontSize: AppSizes.textSemiLarge, fontWeight: FontWeight.bold),
          ),
          title: Text(
            '#${createInvoiceEntities.id?.toString() ?? '0000'}',
            style: const TextStyle(fontSize: AppSizes.textVerySmall),
          ),
          trailing: SizedBox(
              width: 50, height: 20, child: Image.asset(ImageManger.logoImage)),
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
                      fontSize: AppSizes.textTiny, color: Color(AppColor.gray)),
                ),
                const SizedBox(height: 8),
                Text(
                  createInvoiceEntities.client?.fullName.toString() ??
                      'Talents Valley',
                  style: const TextStyle(
                    color: Color(AppColor.primaryTextColor),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'LLC 30 North Gould St.\nSheridan, Wyoming 82801\n${createInvoiceEntities.client?.address.country ?? ''}\n+1 307-217-6666',
                  style: const TextStyle(
                      fontSize: AppSizes.textTiny, color: Color(AppColor.gray)),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bill To',
                  style: TextStyle(
                      fontSize: AppSizes.textTiny, color: Color(AppColor.gray)),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Talent\'s Valley',
                  style: TextStyle(
                    color: Color(AppColor.primaryTextColor),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  createInvoiceEntities.client?.email ?? '',
                  style: const TextStyle(
                      fontSize: AppSizes.textTiny, color: Color(AppColor.gray)),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Issue Date',
                  style: TextStyle(
                      fontSize: AppSizes.textTiny, color: Color(AppColor.gray)),
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
          itemCount: createInvoiceEntities.fixed?.length ?? 2,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  createInvoiceEntities.fixed![index].itemName ?? '',
                  style: const TextStyle(
                      color: Color(AppColor.primaryTextColor),
                      fontSize: AppSizes.textDefaultSize),
                ),
                Text(
                  '\$ ${createInvoiceEntities.fixed![index].price ?? '00.00'}',
                  style: const TextStyle(
                      fontSize: AppSizes.textTiny, color: Color(AppColor.gray)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(''),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        SizedBox(height: 10),
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
                    const SizedBox(width: 25),
                    SizedBox(
                      height: 130,
                      width: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: createInvoiceEntities.fixed?.length ?? 0,
                            itemBuilder: (context, index) {
                              final item = createInvoiceEntities.fixed![index];
                              return Text(
                                '\$ ${item.price.toString()}',
                              );
                            },
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            '\$ .. ',
                            style: TextStyle(color: Color(AppColor.gray)),
                          ),
                          const Divider(),
                          Text(
                            '\$ ${totalFees(createInvoiceEntities.fixed?.fold(0.0, (previousValue, element) => previousValue + element.price!) ?? 0.0, 0.0).toString()}',
                          )
                        ],
                      ),
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
  }

  double totalFees(subtotal, fee) {
    var totalFee = subtotal - (subtotal - fee);
    return subtotal - totalFee;
  }
}
