import 'package:flutter/material.dart';
import 'package:invoice_system/domain/entities/create_invoice_entities.dart';
import 'package:invoice_system/main.dart';
import 'package:invoice_system/presentation/screens/invoice_flow/create_invoice.dart';
import 'package:invoice_system/presentation/screens/link_flow/create_link.dart';
import 'package:invoice_system/presentation/screens/login_scree.dart';

import '../../domain/usecase/create_Service_usecase.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/invoice_flow/ShowDetailsInvoiceScreen.dart';
import '../../presentation/screens/invoice_flow/previewDetails_invoice_screen.dart';
import '../../presentation/screens/invoice_flow/preview_invoice_screen.dart';
import '../../presentation/screens/link_flow/link_state_screen.dart';
import '../../presentation/screens/link_flow/preview_service_screen.dart';
import '../../presentation/screens/main_screen.dart';
import '../../presentation/screens/shared_screens/InvoiceListTabsScreen.dart';
import 'named_router.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    dynamic data = settings.arguments;

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
      case ScreenName.invoiceListTabsScreen:
        result = const InvoiceListTabsScreen();
        break;
      case ScreenName.loginScreen:
        result = const LogInScreen();
        break;
      case ScreenName.showDetailsInvoiceScreen:
        result = ShowDetailsInvoiceScreen(
          id: data,
        );
        break;
      case ScreenName.detailsScreen:
        result = InvoiceDetailsScreen(
          id: data,
        );
        break;
      case ScreenName.linkStateScreen:
        result = LinkStateScreen();
        break;
      case ScreenName.mainScreen:
        result = const MainScreen();
        break;
      case ScreenName.previewServiceScreen:
        result = PreviewServiceScreen(
          createInvoiceEntities: data as CreateServiceParameter,
        );
        break;
      case ScreenName.previewScreen:
        result = PreviewScreen(
          createInvoiceEntities: data as CreateInvoiceEntities,
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
