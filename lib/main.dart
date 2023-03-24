import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:invoice_system/core/routes/app_router.dart';
import 'package:invoice_system/core/routes/generate_routes.dart';
import 'package:invoice_system/core/routes/named_router.dart';

import 'package:invoice_system/utils/helper.dart';

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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Helper.scaffoldKey,
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

// Future<InvoiceDetailsModel> getInvoiceDetails() async {
//   final response = await BaseClient().get(
//     EndPoints.getInvoice('641cd5994a984c6dd37312f1'),
//     options: Options(
//       method: 'GET',
//       headers: {
//         'Authorization':
//             'Bearer ${SharedPrefController().getUser().accessToken}'
//       },
//       validateStatus: (_) => true,
//       contentType: Headers.jsonContentType,
//       responseType: ResponseType.json,
//     ),
//   );
//
//   print("API Response : ${response.data}");
//
//   if (response.statusCode == 200) {
//     print("API Response : ${response.data['data']}");
//     return InvoiceDetailsModel.fromJson(response.data);
//   } else {
//     throw ServerExceptions(
//       errorMessageModel: ErrorMessageModel(response.toString()),
//     );
//   }
// }
