import 'package:flutter/material.dart';
import 'package:invoice_system/core/routes/app_router.dart';
import 'package:invoice_system/utils/appConst.dart';

class CustomBottomSheetInvoiceFilter extends StatefulWidget {
  const CustomBottomSheetInvoiceFilter({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomSheetInvoiceFilter> createState() =>
      _CustomBottomSheetInvoiceFilterState();
}

class _CustomBottomSheetInvoiceFilterState
    extends State<CustomBottomSheetInvoiceFilter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filter',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: AppSizes.textSemiLarge,
                  color: Color(AppColor.primaryTextColor),
                ),
              ),
              InkWell(
                  onTap: () {
                    AppRouter.back();
                  },
                  child: const Icon(
                    Icons.close,
                    size: 20,
                  ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            height: 0.5,
            thickness: 0.5,
            color: Color(AppColor.borderColor),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              // AppRouter.goTo(screenName: ScreenName.withdrawRequestBankScreen);
            },
            child: const Text(
              'All Invoices',
              style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: AppSizes.textDefaultSize,
                  color: Color(AppColor.primaryTextColor),
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              //  AppRouter.goTo(screenName: ScreenName.withdrawRequestCashScreen);
            },
            child: const Text(
              'Pending Invoices',
              style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: AppSizes.textDefaultSize,
                  color: Color(AppColor.primaryTextColor),
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              //  AppRouter.goTo(screenName: ScreenName.withdrawRequestCashScreen);
            },
            child: const Text(
              'Paid Invoices',
              style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: AppSizes.textDefaultSize,
                  color: Color(AppColor.primaryTextColor),
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              //  AppRouter.goTo(screenName: ScreenName.withdrawRequestCashScreen);
            },
            child: const Text(
              'Sent Invoices',
              style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: AppSizes.textDefaultSize,
                  color: Color(AppColor.primaryTextColor),
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

/*
showModalBottomSheet(
            shape: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                borderSide: BorderSide.none),
            backgroundColor: Colors.white,
            context: context,
            isScrollControlled: true,
            builder: (context) => SizedBox(
              child: ContentOfBottomSheet(
                midea: MediaQuery.of(context).size,
              ),
            ),
          );
 */
