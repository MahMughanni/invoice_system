import 'package:flutter/material.dart';
import 'package:invoice_system/utils/appConst.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.topCenter,
      height: height * .35,
      width: width * .5,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageManger.logoImage),
          fit: BoxFit.contain,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
