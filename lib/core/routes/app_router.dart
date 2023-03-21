import 'package:flutter/material.dart';

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static goToAndRemove({required String routeName}) {
    navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  static goTo({required String routeName}) {
    navigatorKey.currentState!.pushNamed(routeName);
  }

  static back() {
    navigatorKey.currentState!.pop();
  }
}
