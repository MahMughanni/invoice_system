import 'package:flutter/material.dart';
import 'package:invoice_system/utils/appConst.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
    required this.paddingTop,
  }) : super(key: key);

  final Widget child;
  final double height;
  final double width;
  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(
        top: paddingTop,
        right: AppConstantsPadding.screenHorizontalPadding,
        left: AppConstantsPadding.screenHorizontalPadding,
      ),
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(
            color: ColorManger.boarderColor,
            width: 1,
          ),
          color: ColorManger.containerColor,
          borderRadius: BorderRadius.circular(
            AppConstantsRadius.balanceContainerRadius,
          )),
      child: child,
    );
  }
}
