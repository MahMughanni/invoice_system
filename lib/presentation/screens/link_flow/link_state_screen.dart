import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoice_system/domain/entities/invoice_details_entities.dart';

import '../../../core/routes/app_router.dart';
import '../../../core/routes/named_router.dart';
import '../../../utils/appConst.dart';
import '../../../utils/helper.dart';

import '../shared_widget/custom_button.dart';
import '../widget/TimelineWidget.dart';
import '../widget/shared_appbar.dart';

class LinkStateScreen extends StatelessWidget {
  LinkStateScreen({Key? key}) : super(key: key);

  String link = 'https://buy.stripe.com/6oEg0qcMW2J9bU4e9R';

  // هدولا مكررات بدهم اعملهم جينارتد

  List<String> timelineStatLeft = ['7:30 am', '2:30 am', '7:30 am', '2:30 am'];
  List<String> timelineStatRight = [
    'Created',
    'Approved and Sent',
    'Approved and Sent',
    'Created'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        title: 'Link',
        isBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
        ),
        child: ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: SvgPicture.asset(
                IconsManger.link,
                colorFilter: const ColorFilter.mode(
                  Color(AppColor.activeColor),
                  BlendMode.srcIn,
                ),
              ),
              title: const Text(
                'Active',
                style: TextStyle(
                    color: Color(AppColor.activeColor),
                    fontSize: AppSizes.textSemiLarge,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: const Text(
                'The link is active to be sent',
                style: TextStyle(
                  fontSize: AppSizes.textTiny,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'Created: 8 June 2022',
                    style: TextStyle(
                        color: Color(AppColor.gray),
                        fontSize: AppSizes.textVeryTiny),
                  ),
                  Text('')
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Graphic Design',
                  style: TextStyle(
                    fontSize: AppSizes.textDefaultSize,
                    color: Color(AppColor.primaryTextColor),
                  ),
                ),
                Text(
                  'SAR 1000',
                  style: TextStyle(
                    fontSize: AppSizes.textDefaultSize,
                    color: Color(AppColor.primaryTextColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(AppColor.backGroundTextFieldColor),
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                        color: const Color(AppColor.primaryButtonColor),
                      )),
                  child: SelectableText(
                    link,
                    maxLines: 1,
                    minLines: 1,
                    style: const TextStyle(
                        color: Color(AppColor.primaryTextColor),
                        fontSize: AppSizes.textSmall),
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      selectAll: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                  child: CustomButton(
                      title: 'Copy',
                      textColorIsWhite: true,
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: link))
                            .then((value) {
                          //only if ->
                          UtilsConfig.showSnackBarMessage(
                              message: 'Copyed', status: true);
                        });
                      }))
            ]),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(AppColor.backGroundTextFieldColor),
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: const Color(AppColor.borderColor),
                  )),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        'Balance',
                        style: TextStyle(color: Color(AppColor.gray)),
                      ),
                      Text(
                        'Paid Invoices',
                        style: TextStyle(color: Color(AppColor.gray)),
                      ),
                      Text(
                        'Fees',
                        style: TextStyle(color: Color(AppColor.gray)),
                      ),
                      SizedBox(width: 1),
                      Text(
                        'Total',
                        style: TextStyle(color: Color(AppColor.gray)),
                      ),
                      SizedBox(width: 1),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'SAR 1000',
                          style: TextStyle(
                              color: Color(AppColor.primaryTextColor)),
                        ),
                        // SizedBox(width: 5),
                        Text(
                          'SAR 3',
                          style: TextStyle(
                              color: Color(AppColor.primaryTextColor)),
                        ),
                        SizedBox(width: 1),
                        Text(
                          'SAR 50',
                          style: TextStyle(
                              color: Color(AppColor.primaryTextColor)),
                        ),
                        Text(
                          'SAR 3150',
                          style: TextStyle(
                              color: Color(AppColor.primaryTextColor)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                        color: Color(AppColor.borderColor),
                      ),
                    ),
                    tileColor: const Color(AppColor.white),
                    leading: const Text(
                      'Mohammed Saad',
                      style: TextStyle(
                          color: Color(AppColor.primaryTextColor),
                          fontSize: AppSizes.textMedium),
                    ),
                    title: Row(
                      children: [
                        const Text(
                          'by',
                          style: TextStyle(
                              fontSize: AppSizes.textVeryTiny,
                              color: Color(AppColor.gray)),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SvgPicture.asset(
                          IconsManger.line,
                          width: 15,
                          height: 15,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'PayPal',
                          style: TextStyle(
                              fontSize: AppSizes.textVeryTiny,
                              color: Color(AppColor.gray)),
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'SAR 1000',
                          style: TextStyle(
                              color: Color(AppColor.primaryTextColor),
                              fontSize: AppSizes.textMedium),
                        ),
                        Text(
                          '5 June, 7:30 pm',
                          style: TextStyle(
                              fontSize: AppSizes.textVeryTiny,
                              color: Color(AppColor.gray)),
                        )
                      ],
                    )),
              ),
            ),
            const SizedBox(height: 15),
            TimelineWidget(
              history: [
                HistoryEntities(
                    sId: '',
                    type: '',
                    action: '',
                    status: '',
                    createdBy: '',
                    createdAt: '',
                    updatedAt: ''),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  // context.read<ProviderShowCard>().showcard();
                },
                child: const Text('Show Invoice'),
              ),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: false,
              child: Container(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  isBorder: true,
                  title: 'Switch to Inactive',
                  textColor: AppColor.primaryTextColor,
                  textColorIsWhite: false,
                  onPressed: () {
                    //   UtilsConfig.showAlertDialog(context,
                    //       'Are you sure you want to cancel your invoice?');
                  },
                  width: 160,
                ),
                CustomButton(
                  isBorder: true,
                  title: 'Edit',
                  textColor: AppColor.primaryButtonColor,
                  textColorIsWhite: false,
                  onPressed: () {
                    AppRouter.goTo(screenName: ScreenName.createInvoiceScreen);
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
  }
}
