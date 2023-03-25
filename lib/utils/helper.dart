import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:invoice_system/core/routes/app_router.dart';

import 'appConst.dart';

class Helper {
  static String formatTime(data) {
    DateTime createdDate = DateTime.parse(data);
    String formattedDate = DateFormat.yMMMEd().format(createdDate);
    return formattedDate;
  }
  static String formatTime2(data) {
    DateTime createdDate = DateTime.parse(data);
    String formattedDate = DateFormat.MMMEd().format(createdDate);
    return formattedDate;
  }
  static String formatTime3(data) {
    DateTime createdDate = DateTime.parse(data);
    String formattedDate = DateFormat.MEd().format(createdDate);
    return formattedDate;
  }

  static Color setColor(var data) {
    return data == 'pending'
        ? AppColor.pendingStateColor
        : data == 'sent'
            ? AppColor.sentStateColor
            : data == 'pending_approval'.toString()
                ? AppColor.pendingStateColor
                : data == 'paid'
                    ? Colors.green
                    : data == 'cancelled'
                        ? Colors.black.withOpacity(.7)
                        : data == 'active'
                            ? Colors.blue
                            : data == 'inactive'
                                ? Colors.black
                                : Colors.black;
  }

  static Widget setIcon(status) {
    return status == 'pending_approval'
        ? SvgPicture.asset(IconsManger.wallClock)
        : status == 'sent'
            ? SvgPicture.asset(IconsManger.send)
            : status == 'cancelled'
                ? SvgPicture.asset(IconsManger.forbidden)
                : SvgPicture.asset(IconsManger.send);
  }

  static String getTime(var now) {
    String convertedDateTime =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";

    return convertedDateTime;
  }

  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBarMessage({required String message, required bool status}) {
    return scaffoldKey.currentState!.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: status ? Colors.green : Colors.grey,
          )),
      content: status
          ? Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            )
          : Text(message),
      elevation: 0,
      backgroundColor: status ? const Color(0xFFE9F7E7) : Colors.black45,
    ));
  }
}

class UtilsConfig {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBarMessage({required String message, required bool status}) {
    return scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.access_alarms,
              color: Color(AppColor.borderSnackBarFalse),
            ),
            Text(
              message,
              style: const TextStyle(
                  fontSize: AppSizes.textDefaultSize,
                  color: Color(AppColor.primaryTextColor)),
            ),
          ],
        ),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: status
                ? const Color(AppColor.borderSnackBarTrue)
                : const Color(AppColor.borderSnackBarFalse),
          ),
        ),
        elevation: 0,
        backgroundColor: status
            ? const Color(AppColor.backGroundSnackBarTrue)
            : const Color(AppColor.backGroundSnackBarFalse),
      ),
    );
  }

  static showAlertDialog(BuildContext context, String title) {
    AlertDialog alert = AlertDialog(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actionsAlignment: MainAxisAlignment.center,
      icon: Align(
        alignment: Alignment.topRight,
        child: InkWell(
          onTap: () {
            AppRouter.back();
          },
          child: const Icon(
            Icons.close,
            size: 20,
          ),
        ),
      ),
      iconPadding: const EdgeInsets.only(right: 10, top: 10),
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Color(AppColor.primaryTextColor),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              backgroundColor: const Color(AppColor.whiteTextButtonColor),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color(AppColor.borderColor),
                ),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              'No',
              style: TextStyle(color: Color(AppColor.primaryTextColor)),
            )),
        ElevatedButton(
          onPressed: () {
            AppRouter.back();
            UtilsConfig.showSnackBarMessage(
                message: 'Bank account has been deleted.', status: true);
            //  bank.removeItem(index);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(AppColor.whiteTextButtonColor),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color(AppColor.borderColor),
                ),
                borderRadius: BorderRadius.circular(7),
              )),
          child: const Text(
            'Yes',
            style: TextStyle(
              color: Color(AppColor.primaryTextColor),
            ),
          ),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
