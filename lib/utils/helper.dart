import 'dart:ui';

import 'package:flutter/material.dart';

import 'ImageManger.dart';

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
}
