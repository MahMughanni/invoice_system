import 'package:flutter/material.dart';
import 'package:invoice_system/utils/appConst.dart';



class SearchBar extends StatelessWidget {
   SearchBar({
    super.key,
    required this.onPressed,
  });

  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextField(
      // controller: nameController,
      // onChanged: (value) {
      // },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 17),
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.filter_list),
        ),
        label: const Text('Search'),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(AppColor.borderColor),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(AppColor.borderColor),
          ),
        ),
      ),
    );
  }
}
