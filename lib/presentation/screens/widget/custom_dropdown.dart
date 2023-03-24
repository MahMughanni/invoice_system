import 'package:flutter/material.dart';
import 'package:invoice_system/utils/appConst.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.dropDownValue,
    required this.items,
  });

  final String dropDownValue;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(AppColor.backGroundTextFieldColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(
            color: Color(AppColor.borderColor),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(
            color: Color(AppColor.borderColor),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(
            color: Color(AppColor.borderColor),
          ),
        ),
      ),
      borderRadius: BorderRadius.circular(7),
      style: const TextStyle(
          color: Color(AppColor.gray), fontSize: AppSizes.textDefaultSize),
      value: dropDownValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),

      // logic here
      onChanged: (String? value) {},
    );
  }
}
