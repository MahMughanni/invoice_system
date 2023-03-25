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

import 'domain/usecase/create_Service_usecase.dart';
import 'presentation/controller/localData/shared_perf.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().init();
  ServicesLocator().init();
  // login();
  createService();
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
      initialRoute: ScreenName.loginScreen,
      navigatorKey: AppRouter.navigatorKey,
    );
  }
}

Future<String> createService() async {
  try {
    // var fixed = parameter.newServiceEntities.fixed;
    // var currency = parameter.newServiceEntities.currency;
    final response = await BaseClient().post(EndPoints.createService,
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${SharedPrefController().getUser().accessToken}'
          },
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
        data: {
          'fixed': [
            {
              "itemName": "prod test job",
              "description": "test invoice",
              "price": 11210
            },
            {
              "itemName": "prod test job",
              "description": "test invoice",
              "price": 3200
            }
          ],
          'currency': "USD",
        });

    print("Response $response");
    print("Response Data ${response.data}");
    return response.data;
  } on DioError catch (e) {
    if (e.response != null) {
      // The server returned an error response
      print('Error status code: ${e.response?.statusCode ?? 'error'}');
      print('Error message: ${e.response?.data ?? 'error 222'}');
    } else {
      print('Error sending request: $e');
    }
    rethrow;
  }
}

// Future<String> createService(CreateServiceParameter parameter) async {
//   try {
//     var fixed = parameter.newServiceEntities.fixed;
//     var currency = parameter.newServiceEntities.currency;
//
//
//
//     final response = await BaseClient().post(EndPoints.createService,
//         options: Options(
//           headers: {'Authorization': 'Bearer ${SharedPrefController}'},
//           validateStatus: (_) => true,
//           contentType: Headers.jsonContentType,
//           responseType: ResponseType.json,
//         ),
//         data: {
//           'fixed': fixed.map((item) => item.toJson()).toList(),
//           'currency': currency,
//         });
//
//     return response.data['data']['_id'];
//   } on DioError catch (e) {
//     if (e.response != null) {
//       // The server returned an error response
//       print('Error status code: ${e.response?.statusCode ?? 'error'}');
//       print('Error message: ${e.response?.data ?? 'error 222'}');
//     } else {
//       print('Error sending request: $e');
//     }
//     rethrow;
//   }
// }
