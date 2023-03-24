import 'package:flutter/material.dart';
import 'package:invoice_system/core/routes/app_router.dart';
import 'package:invoice_system/core/routes/named_router.dart';
import 'package:invoice_system/utils/appConst.dart';

import 'mainCont.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return MainContainer(
      height: height * .25,
      width: double.infinity,
      paddingTop: AppConstantsPadding.screenVerticalPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: Text('Balance',
                style: TextStyle(
                  color: const Color(0xff505050).withOpacity(0.75),
                )),
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  text: '\$200',
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: '.00',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black.withOpacity(.8),
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                color: Colors.blue,
                onPressed: () {},
                icon: Image.asset(
                  ImageManger.logoImage,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(145, 35),
                    backgroundColor: AppColor.backgroundColor,
                  ),
                  onPressed: () {
                    AppRouter.goTo(screenName: ScreenName.createLinkScreen);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Create Link')),
              TextButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(145, 35),
                    backgroundColor: AppColor.backgroundColor,
                  ),
                  onPressed: () {
                    AppRouter.goTo(screenName: ScreenName.createInvoiceScreen);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Send Invoice')),
            ],
          ),
        ],
      ),
    );
  }
}
