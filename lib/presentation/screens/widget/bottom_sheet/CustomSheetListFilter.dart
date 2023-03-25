import 'package:flutter/material.dart';
import 'package:invoice_system/core/routes/app_router.dart';
import 'package:invoice_system/utils/appConst.dart';

class CustomSheetListFilter extends StatefulWidget {
  const CustomSheetListFilter({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomSheetListFilter> createState() => _CustomSheetListFilterState();
}

class _CustomSheetListFilterState extends State<CustomSheetListFilter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingHorizontal,
        vertical: 15,
      ),
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
              'All Links',
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
              'Active Links',
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
              'Inactive Links',
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
              'Pending Links',
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
