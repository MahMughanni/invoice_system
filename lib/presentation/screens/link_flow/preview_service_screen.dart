import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:invoice_system/core/routes/app_router.dart';
import 'package:invoice_system/core/routes/named_router.dart';
import 'package:invoice_system/presentation/controller/create_invoice_bloc/create_invoice_bloc.dart';
import 'package:invoice_system/presentation/controller/create_service_bloc/create_service_bloc.dart';

import 'package:invoice_system/presentation/controller/invoice_details_bloc/invoice_details_bloc.dart';
import 'package:invoice_system/presentation/controller/localData/shared_perf.dart';
import 'package:invoice_system/presentation/screens/widget/shared_appbar.dart';
import 'package:invoice_system/utils/appConst.dart';
import 'package:invoice_system/utils/helper.dart';

import '../../../core/services/services_locator.dart';
import '../../../domain/entities/create_invoice_entities.dart';
import '../../../domain/usecase/create_Service_usecase.dart';
import '../shared_widget/custom_button.dart';

class PreviewServiceScreen extends StatelessWidget {
  const PreviewServiceScreen({
    Key? key,
    required this.createInvoiceEntities,
  }) : super(key: key);
  final CreateServiceParameter createInvoiceEntities;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CreateServiceBloc>(),
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
  final CreateServiceParameter createInvoiceEntities;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateServiceBloc, CreateServiceSuccess>(
      builder: (context, state) {
        // print(state.invoiceDetailsModel.client);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              title: 'Send Invoice',
              textColorIsWhite: true,
              onPressed: () {
                //
                BlocProvider.of<CreateServiceBloc>(context).add(
                  CreateServiceRequested(parameter: createInvoiceEntities),
                );

                // Future.delayed(const Duration(microseconds: 500), () {
                //   AppRouter.goToAndRemove(
                //       screenName: ScreenName.invoiceListTabsScreen);
                // });
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

  final CreateServiceParameter createInvoiceEntities;

  // List<dynamic> fixed = [];

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    String formattedDate = DateFormat.yMMMd().format(time);
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
                fontSize: AppSizes.textSemiLarge, fontWeight: FontWeight.bold),
          ),
          title: const Text(
            '#0000',
            style: TextStyle(fontSize: AppSizes.textVerySmall),
          ),
          trailing: SizedBox(
              width: 50, height: 20, child: Image.asset(ImageManger.logoImage)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'From',
                  style: TextStyle(
                      fontSize: AppSizes.textTiny, color: Color(AppColor.gray)),
                ),
                SizedBox(height: 8),
                Text(
                  'Talents Valley',
                  style: TextStyle(
                    color: Color(AppColor.primaryTextColor),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'LLC 30 North Gould St.\nSheridan, Wyoming 82801 ?? '
                  '}\n+1 307-217-6666',
                  style: TextStyle(
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
                const Text(
                  'Heba@gmail.com',
                  style: TextStyle(
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
          itemCount: createInvoiceEntities.newServiceEntities.fixed.length ?? 2,
          itemBuilder: (context, index) => ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              createInvoiceEntities.newServiceEntities.fixed![index].itemName ??
                  '',
              style: const TextStyle(color: Color(AppColor.primaryTextColor)),
            ),
            trailing: Text(
              '\$ ${createInvoiceEntities.newServiceEntities.fixed![index].price ?? '00.00'}',
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
                    SizedBox(
                      height: 130,
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: createInvoiceEntities
                                    .newServiceEntities.fixed?.length ??
                                0,
                            itemBuilder: (context, index) {
                              final item = createInvoiceEntities
                                  .newServiceEntities.fixed![index];
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
                            '\$ ${totalFees(createInvoiceEntities.newServiceEntities.fixed?.fold(0.0, (previousValue, element) => previousValue + element.price!) ?? 0.0, 0.0).toString()}',
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
