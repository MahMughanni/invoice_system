import 'package:flutter/material.dart';
import 'package:invoice_system/presentation/screens/widget/custom_button.dart';
import 'package:invoice_system/presentation/screens/widget/custom_dropdown.dart';
import 'package:invoice_system/utils/appConst.dart';

import 'package:provider/provider.dart';

import '../invoice_flow/create_invoice.dart';
import '../widget/shared_appbar.dart';

class CreateLinkScreen extends StatelessWidget {
  CreateLinkScreen({Key? key}) : super(key: key);
  String dropdownvalue = 'USD';

  var country = [
    'USD',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(isBack: true, title: 'Create Link'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingHorizontal,
            vertical: AppSizes.paddingVertival),
        child: ListView(
          children: [
            const Text(
              'Currency',
              style: TextStyle(
                  fontSize: AppSizes.textDefaultSize,
                  color: Color(AppColor.gray)),
            ),
            const SizedBox(height: 8),
            CustomDropDown(dropDownValue: dropdownvalue, items: country),
            // ServiceAndItem(),
            TextButton(
              onPressed: () {
                // context.read<ProviderToAddList>().increment();
              },
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text('+ Add item or service'),
              ),
            ),
            const SizedBox(height: 10),
            CustomMainButton(
              title: 'Preview Link',
              isBorder: false,
              textColorIsWhite: true,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
