import 'package:flutter/material.dart';
import 'package:invoice_system/main.dart';
import 'package:invoice_system/presentation/screens/invoice_flow/create_invoice.dart';
import 'package:invoice_system/presentation/screens/link_flow/create_link.dart';

import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/invoice_flow/preview_invoice_screen.dart';
import '../../presentation/screens/main_screen.dart';
import 'named_router.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    var data = settings.arguments;

    Widget result;
    switch (settings.name) {
      case ScreenName.homeScreen:
        result = const HomeScreen();
        break;

      case ScreenName.createInvoiceScreen:
        result = const CreateInvoiceScreen();
        break;
      case ScreenName.createLinkScreen:
        result = CreateLinkScreen();
        break;

      case ScreenName.mainScreen:
        result = const MainScreen();
        break;
      case ScreenName.previewScreen:
        result = PreviewScreen(
          id: data as String,
        );
        break;
      default:
        result = const Scaffold(
          body: Center(
            child: Text(
              'Wrong path',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
    }
    return MaterialPageRoute(builder: (context) => result);
  }
}
