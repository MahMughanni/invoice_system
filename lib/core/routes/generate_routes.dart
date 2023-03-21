import 'package:flutter/material.dart';

import '../../presentation/screens/main_screen.dart';
import 'named_router.dart';

class OnGenerateRoutes {
  static Route<dynamic> onGenerateRouter(RouteSettings settings) {
    dynamic result;

    switch (settings.name) {
      case NamedRouter.mainScreen:
        result = const MainScreen();
        break;

      default:
        result = const Scaffold(
          body: Center(
            child: Text('Wrong path'),
          ),
        );
    }
    return MaterialPageRoute(builder: (BuildContext context) => result);
  }
}
