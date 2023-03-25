import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:invoice_system/core/routes/app_router.dart';
import 'package:invoice_system/core/routes/generate_routes.dart';
import 'package:invoice_system/core/routes/named_router.dart';

import 'package:invoice_system/utils/helper.dart';

import 'core/base_usecase/base_usecase.dart';
import 'core/error/exception.dart';
import 'core/network/api_constants.dart';
import 'core/network/app_exception.dart';
import 'core/network/base_client.dart';
import 'core/services/services_locator.dart';
import 'data/models/user_model.dart';

import 'presentation/controller/localData/shared_perf.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().init();
  ServicesLocator().init();
  login();

  // changeInvoiceStatus('641e5a5b73ac594b84ecc056');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: UtilsConfig.scaffoldKey,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: ScreenName.mainScreen,
      navigatorKey: AppRouter.navigatorKey,
    );
  }
}

login() async {
  try {
    final response = await BaseClient().post(
      EndPoints.login,
      data: {
        "email": "hebaskhail@gmail.com",
        "password": "Heba@123456",
      },
    );

    if (response.statusCode == 200) {
      SharedPrefController().save(UserModel.fromJson(response.data["data"]));
      response;
    }
  } on DioError catch (e) {
    final errorMessage = DioExceptions.fromDioError(e);
    Helper.showSnackBarMessage(message: errorMessage, status: false);
  }
}

