import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice_system/presentation/screens/invoice_flow/previewDetails_invoice_screen.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../core/routes/app_router.dart';
import '../../../core/routes/named_router.dart';
import '../../../core/services/services_locator.dart';
import '../../../utils/appConst.dart';
import '../../../utils/helper.dart';
import '../../controller/invoice_details_bloc/invoice_details_bloc.dart';
import '../shared_widget/custom_button.dart';
import '../shared_widget/main_container.dart';
import '../widget/TimelineWidget.dart';
import '../widget/shared_appbar.dart';

class ShowDetailsInvoiceScreen extends StatelessWidget {
  ShowDetailsInvoiceScreen({Key? key, required this.id}) : super(key: key);
  String id;

  //
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => getIt<InvoiceDetailsBloc>()
        ..add(
          InvoiceDetailsEvent(id: id),
        ),
      child: InvoiceDetailsScreenBody(),
    );
  }
}

class InvoiceDetailsScreenBody extends StatefulWidget {
  InvoiceDetailsScreenBody({Key? key}) : super(key: key);

  @override
  State<InvoiceDetailsScreenBody> createState() =>
      _InvoiceDetailsScreenBodyState();
}

class _InvoiceDetailsScreenBodyState extends State<InvoiceDetailsScreenBody> {
  bool isVisiable = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return BlocBuilder<InvoiceDetailsBloc, InvoiceDetailsState>(
      builder: (context, state) {
        var historyData = state.invoiceDetailsModel.history;

        var data = state.invoiceDetailsModel;
        // List timelineStatRight = [
        //   historyData
        // ];
        // List timelineStatLeft = [];
        print(state.invoiceDetailsModel.history);
        return Scaffold(
          appBar: SharedAppBar(title: 'Invoice', isBack: true),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingHorizontal),
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  leading: SvgPicture.asset(IconsManger.wallClock),
                  title: Text(
                    data.status ?? 'pending',
                    style: const TextStyle(
                      fontSize: AppSizes.textSemiLarge,
                      fontWeight: FontWeight.w600,
                      color: Color(AppColor.pendColor),
                    ),
                  ),
                  subtitle: Text(
                    Helper.formatTime(
                        data.createdAt ?? '2023-03-23T23:19:42.368Z'),
                    style: const TextStyle(
                      fontSize: AppSizes.textTiny,
                      color: Color(AppColor.gray),
                    ),
                  ),
                  trailing: Text(
                    Helper.formatTime2(
                        data.createdAt ?? '2023-03-23T23:19:42.368Z'),
                    style: const TextStyle(
                      fontSize: AppSizes.textTiny,
                      color: Color(AppColor.gray),
                    ),
                  ),
                ),
                const ContentInPreviewCard(),
                const Divider(),
                const SizedBox(height: 5),
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
                                  '\$ ${data.subTotal.toString()}',
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '\$ ${data.ourFee}',
                                  style: const TextStyle(
                                      color: Color(AppColor.gray)),
                                ),
                                const Divider(),
                                Text(
                                  '\$ ${data.subTotal.toString()}',
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

                MainContainer(
                  //height: height * .25,
                  width: double.infinity,
                  paddingTop: 15,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          StringManger.timeline,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: historyData?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              // timelineStatLeft = [
                              //   historyData?[index]..toString(),
                              //   historyData?[index].updatedAt.toString(),
                              // ];
                              // timelineStatLeft = [
                              //   historyData?[index].action,
                              //   historyData?[index].status,
                              // ];
                              return TimelineTile(
                                alignment: TimelineAlign.manual,
                                lineXY: .3,
                                isFirst: index == 0,
                                indicatorStyle: const IndicatorStyle(
                                  indicatorXY: .5,
                                  width: 8,
                                  color: AppColor.primaryColor,
                                ),
                                endChild: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(historyData?[index]
                                              .status
                                              .toString() ??
                                          '1'),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                          historyData?[index].type.toString() ??
                                              '1'),
                                    ],
                                  ),
                                ),
                                startChild: Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(Helper.formatTime3(
                                          historyData?[index].createdAt)),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(Helper.formatTime3(
                                          historyData?[index].updatedAt)),
                                    ],
                                  ),
                                ),
                                beforeLineStyle: const LineStyle(
                                  color: AppColor.primaryColor,
                                  thickness: 1,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                // TimelineWidget(
                //   history: historyData ?? [],
                // ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isVisiable = !isVisiable;
                      });
                      // context.read<ProviderShowCard>().showcard();
                    },
                    child: Text(
                        isVisiable == false ? 'Show Invoice' : 'Hide Invoice'),
                  ),
                ),
                const SizedBox(height: 10),
                Visibility(
                  visible: isVisiable,
                  child: const ContentInPreviewCard(),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      isBorder: true,
                      title: 'Cancel',
                      textColor: AppColor.primaryTextColor,
                      textColorIsWhite: false,
                      onPressed: () {
                        UtilsConfig.showAlertDialog(context,
                            'Are you sure you want to cancel your invoice?');
                      },
                      width: 160,
                    ),
                    CustomButton(
                      isBorder: true,
                      title: 'Edit',
                      textColor: AppColor.primaryButtonColor,
                      textColorIsWhite: false,
                      onPressed: () {
                        AppRouter.goTo(
                            screenName: ScreenName.createInvoiceScreen);
                      },
                      width: 160,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
