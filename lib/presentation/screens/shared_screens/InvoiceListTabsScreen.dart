import 'package:flutter/material.dart';
import 'package:invoice_system/core/routes/app_router.dart';
import 'package:invoice_system/core/routes/named_router.dart';
import 'package:invoice_system/presentation/screens/shared_screens/ListInTabScreen.dart';
import 'package:invoice_system/utils/appConst.dart';

import 'InvoiceInTabScreen.dart';

class InvoiceListTabsScreen extends StatelessWidget {
  const InvoiceListTabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: AppSizes.hightAppBar,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontFamily: "Segoe UI",
            fontWeight: FontWeight.bold,
            fontSize: AppSizes.textLarge,
            color: Color(
              AppColor.primaryTextColor,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(AppColor.primaryTextColor),
            ),
            onPressed: () {
              AppRouter.goToAndRemove(screenName: ScreenName.mainScreen);
            },
          ),
          title: const Text('Invoices'),
          bottom: const TabBar(
            splashBorderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            splashFactory: InkRipple.splashFactory,
            padding:
                EdgeInsets.symmetric(horizontal: AppSizes.paddingHorizontal),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                color: Color(AppColor.white)),
            tabs: [
              Tab(
                child: Text(
                  'Invoices',
                  style: TextStyle(
                      fontSize: AppSizes.textSemiLarge,
                      color: Color(AppColor.primaryTextColor)),
                ),
              ),
              Tab(
                child: Text(
                  'Links',
                  style: TextStyle(
                    fontSize: AppSizes.textSemiLarge,
                    color: Color(AppColor.primaryTextColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.paddingHorizontal,
              vertical: AppSizes.paddingVertival),
          child: TabBarView(
            children: [
              InvoiceInTabScreen(),
              ListInTabScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
