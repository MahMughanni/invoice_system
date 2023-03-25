import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:invoice_system/core/routes/app_router.dart';

import '../../core/network/api_constants.dart';
import '../../core/network/app_exception.dart';
import '../../core/network/base_client.dart';
import '../../core/routes/named_router.dart';
import '../../data/models/user_model.dart';
import '../controller/localData/shared_perf.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  Future<void> login() async {
    try {
      final response = await BaseClient().post(
        EndPoints.login,
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
        data: {
          "email": "hebaskhail@gmail.com",
          "password": "Heba@123456",
        },
      );

      if (response.statusCode == 200) {
        SharedPrefController().save(UserModel.fromJson(response.data["data"]));
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      // Helper.showSnackBarMessage(
      //   message: errorMessage,
      //   status: false,
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await login();
            AppRouter.goTo(screenName: ScreenName.mainScreen);
          },
          child: const Text('Login'),
          // print(SharedPrefController().getUser.) ;
        ),
      ),
    );
  }
}
