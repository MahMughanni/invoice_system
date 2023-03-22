import 'package:dio/dio.dart';
import 'package:invoice_system/core/network/base_client.dart';
import 'package:invoice_system/data/models/invoice_model.dart';
import 'package:invoice_system/presentation/controller/localData/shared_perf.dart';
import 'package:invoice_system/utils/helper.dart';

import '../../core/error/exception.dart';
import '../../core/network/api_constants.dart';
import '../../core/network/app_exception.dart';
import '../../domain/usecase/invoice_list_usecase.dart';
import '../../domain/usecase/login_usecase.dart';
import '../models/user_model.dart';

abstract class BaseInvoiceDataSource {
  Future<List<InvoiceModel>> getAllInvoices(InvoiceParameter parameter);

  Future login(LoginParameter parameter);
}

class InvoiceDataSource extends BaseInvoiceDataSource {
  Options options = Options(
    method: 'GET',
    headers: {'Authorization': 'Bearer ${EndPoints.token}'},
    validateStatus: (_) => true,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  );

  @override
  Future<List<InvoiceModel>> getAllInvoices(InvoiceParameter parameter) async {
    var response = await BaseClient().get(
      EndPoints.getInvoiceListing,
      options: Options(
        method: 'GET',
        headers: {'Authorization': 'Bearer ${parameter.token}'},
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );

    if (response.statusCode == 200) {
      return List<InvoiceModel>.from((response.data['data']['invoices'] as List)
          .map((e) => InvoiceModel.fromJson(e))).toList();
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel(response.data.toString()),
      );
    }
  }

  @override
  Future login(LoginParameter parameter) async {
    try {
      final response = await BaseClient().post(
        EndPoints.login,
        data: {
          "email": parameter.email,
          "password": parameter.password,
        },
      );

      // print(response.data);

      if (response.statusCode == 200) {
        SharedPrefController().save(UserModel.fromJson(response.data["data"]));
        return response;
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      Helper.showSnackBarMessage(message: errorMessage, status: false);
    }
  }
}
