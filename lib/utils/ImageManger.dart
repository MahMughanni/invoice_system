import 'package:flutter/material.dart';

class ImageManger {
  static const String assetsImagePath = 'assets/images';
  static const bankImage = '$assetsImagePath/bank.svg';
  static const pageImage = '$assetsImagePath/page.svg';
  static const warningImage = '$assetsImagePath/warning.png';
  static const withdrawImage = '$assetsImagePath/Withdraw.png';
}

class IconsManger {
  static const iconsPath = 'assets/icons';
  static const cashIcon = '$iconsPath/cash.png';
  static const homeIcon = '$iconsPath/home.png';
  static const helpIcon = '$iconsPath/help.png';
  static const invoiceIcon = '$iconsPath/invoice.png';
  static const notificationIcon = '$iconsPath/notification.png';
  static const closeIcon = '$iconsPath/close.svg';
}

class ColorManger {
  static const Color primaryColor = Color(0xff6492EE);
  static const Color unSelectedIconColor = Color(0xffBEC2C6);
  static const Color backgroundBtnColor = Color(0xffF3F6FF);
  static const Color primaryFontColor = Colors.black;

  // static const Color secondaryFontColor = Color(0xff505050);
  static const Color secondaryFontColor = Color(0xff8C8C8C);
  static const Color backgroundColor = Color(0xffF2F4F7);
  static const Color containerColor = Colors.white;

  // static const Color withdrawFontColor = Color(0xff4375FF);
  static const Color sentStateColor = Color(0xff4375FF);
  static const Color completedStateColor = Color(0xffEFEFEF);
  static const Color boarderColor = Color(0xffE2E2E2);

  static const Color pendingStateColor = Color(0xffDAA545);
  static const Color deleteBtnBackground = Color(0xffD84242);
}

class StringManger {
  static const String withdrawalPreview = 'Withdrawal Preview';
  static const String bankAccountNumber = '0454 649667 001 3100';
  static const String amount = 'Amount';
  static const String home = 'Home';
  static const String valMessage = '''Sorry, cents can't be withdrawn for    
cash payout.''';

  static const String amountNotEnough = '''Amount Of Money Not Enough''';

  static const String delete = 'Delete';
  static const String transferredTo = 'Transferred to:';
  static const String transferAmount = 'Transfer amount';
  static const String bankAccountName = 'Bank Account Name';
  static const String confirmReceipt = 'Confirm Receipt';
  static const String expectedDate = 'Expected Date';
  static const String withdrawalDate = 'Withdrawal Date';
  static const String senderName = 'Sender Name';
  static const String fee = 'fee';
  static const String youGet = 'You\'ll get';
  static const String withdrawNow = 'Withdraw Now';
  static const String bankOfPalestine = 'Bank of Palestine';
  static const String balance = 'Balance';
  static const String currentBalance = 'Current Balance';
  static const String withdrawals = 'Withdrawals';
  static const String done = 'Done';
  static const String showMore = 'Show more';
  static const String withdraw = 'Withdraw';
  static const String bankAccount = 'Bank Account';
  static const String timeline = 'Timeline';
  static const String details = 'Details';
  static const String instructions = 'Instructions';
  static const String cancelWithdrawal = 'Cancel Withdrawal';
  static const String cancel = 'Cancel';
  static const String withdrawal = 'Withdrawal';
  static const String reportProblem = 'Report a Problem';
  static const String more = 'More';
  static const String transferScreenshot = 'Transfer Screenshot';
  static const String haveNotReceivedPayout = 'I Haven\'t Received Payout';
}

class AppConstantsPadding {
  static const double screenVerticalPadding = 22;
  static const double screenHorizontalPadding = 16;
  static const double contentBalancePadding = 18;
}

class AppConstantsRadius {
  static const double balanceContainerRadius = 7.0;
  static const double pendingContainerRadius = 30.0;

  static const double bottomLoginRadius = 133.0;
  static const double formFieldRadius = 10.0;
  static const double notificationIconRadius = 5.0;
  static const double newArrivalContainerRadius = 15.0;
}

class AppFontWeightConstants {
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight mostThick = FontWeight.w900;
}
