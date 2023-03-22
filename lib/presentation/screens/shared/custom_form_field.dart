import 'package:flutter/material.dart';
import 'package:invoice_system/utils/appConst.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.validator,
    this.isPassword,
    this.suffixIcon,
    this.initialValue,
    required this.editingController,
  }) : super(key: key);
  final String? hintText, initialValue;
  final String? Function(String?)? validator;
  final bool? isPassword;
  final Widget? suffixIcon;

  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: editingController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isPassword ?? false,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: ColorManger.formFieldFiledColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(9),
        ),
        hintText: hintText,
      ),
    );
  }
}
