import 'package:flutter/material.dart';
import 'package:invoice_system/utils/appConst.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    required this.hintText,
    this.obscureText = false,
    required this.keyboardType,
    this.bottomMargin = 0,
    this.prefixIcon,
    this.onChange,
    this.width = double.infinity,
    this.validator,
    this.controller,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.maxLines = 1,
    this.minLines = 1,
    this.isSuffix = false,
    this.testSuffix = '',
    Key? key,
  }) : super(key: key);
  int maxLines;
  int minLines;

  final String hintText;
  final bool obscureText;
  double bottomMargin;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  Function? onChange;
  TextEditingController? controller;
  AutovalidateMode? autovalidateMode;
  Widget? prefixIcon;
  double width;
  bool isSuffix;
  String testSuffix;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        maxLines: maxLines,
        minLines: minLines,
        style: const TextStyle(color: Color(AppColor.primaryTextColor)),
        onChanged: onChange as Function(String?)?,
        //   onSaved: onSaved as Function(String?)?,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        autovalidateMode: autovalidateMode,
        obscureText: obscureText,
        decoration: InputDecoration(
          errorMaxLines: 3,
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.red,
          )),
          suffix: Visibility(
            visible: isSuffix,
            child: Text(
              testSuffix,
              style: const TextStyle(
                color: Color(AppColor.gray),
              ),
            ),
          ),
          hintText: hintText,
          errorStyle: const TextStyle(fontSize: 12, height: 0.3),
          hintStyle: const TextStyle(color: Color(AppColor.gray)),
          filled: true,
          fillColor: const Color(AppColor.backGroundTextFieldColor),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(AppColor.borderColor),
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(AppColor.borderColor),
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Color(AppColor.borderColor)),
          ),
          // errorBorder:  OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(5),
          //   borderSide: const BorderSide(color: Color(AppColor.borderColor)),
          // ),
        ),
        //autofocus: true ,
      ),
    );
  }
}
