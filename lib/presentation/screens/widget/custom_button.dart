import 'package:flutter/material.dart';
import 'package:invoice_system/utils/appConst.dart';

class CustomMainButton extends StatelessWidget {
  CustomMainButton({
    required this.title,
    this.onPressed,
    super.key,
    this.isBorder = false,
    this.textColorIsWhite = true,
    this.width = double.infinity,
    this.height = 45,
    this.textColor = AppColor.whiteTextButtonColor,
  });

  void Function()? onPressed;
  bool isBorder;
  double width;
  String title;
  bool textColorIsWhite;
  double height;
  int textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          side: isBorder == false
              ? BorderSide.none
              : const BorderSide(color: Color(AppColor.borderColor), width: 1),
          backgroundColor: textColorIsWhite == false
              ? Colors.white
              : const Color(
            AppColor.primaryButtonColor,
                ),
          elevation: 1,
        ),
        child: Text(
          title,
          style: TextStyle(
              fontSize: textColorIsWhite == true
                  ? AppSizes.textSemiLarge
                  : AppSizes.textDefaultSize,
              color: Color(textColor)
              // const Color(AppColor.primaryTextColor),
              ),
        ),
      ),
    );
  }
}
