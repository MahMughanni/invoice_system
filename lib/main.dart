import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_system/presentation/controller/logIn/log_in_bloc.dart';
import 'package:invoice_system/presentation/screens/login_screen.dart';
import 'package:invoice_system/presentation/screens/main_screen.dart';
import 'package:invoice_system/utils/helper.dart';

import 'core/services/services_locator.dart';
import 'presentation/controller/invoice_bloc/invoice_bloc.dart';
import 'presentation/controller/localData/shared_perf.dart';

void main() async {
  ServicesLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Helper.scaffoldKey,
      home: const LoginScreen(),
    );
  }
}
