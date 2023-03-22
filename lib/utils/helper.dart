import 'dart:ui';

import 'package:flutter/material.dart';

import 'appConst.dart';

class Helper {
  static Color setColor(var data) {
    return data.status == 'pending'
        ? ColorManger.pendingStateColor
        : data.status == 'sent'
            ? ColorManger.sentStateColor
            : data.status == 'pending_approval'.toString()
                ? ColorManger.pendingStateColor
                : data.status == 'paid'
                    ? Colors.green
                    : Colors.black;
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
      backgroundColor: status ? Color(0xFFE9F7E7) : Colors.black45,
    ));
  }
}
