import 'package:flutter/material.dart';
import 'package:invoice_system/utils/appConst.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onTap, required this.title})
      : super(key: key);

  final Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        minimumSize: const Size(double.infinity, 44),
        backgroundColor: ColorManger.primaryColor,
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: AppConstFontWeight.medium,
        ),
      ),
    );
  }
}
