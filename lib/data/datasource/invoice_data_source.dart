import 'package:dio/dio.dart';
import 'package:invoice_system/core/network/base_client.dart';
import 'package:invoice_system/data/models/create_invoice_model.dart';
import 'package:invoice_system/data/models/invoice_details_model.dart';
import 'package:invoice_system/data/models/invoice_model.dart';
import 'package:invoice_system/domain/entities/create_invoice_entities.dart';
import 'package:invoice_system/domain/entities/fixed_entities.dart';
import 'package:invoice_system/domain/usecase/create_new_invoice_usecase.dart';
import 'package:invoice_system/domain/usecase/invoice_details_usecase.dart';
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

  Future<String> createInvoice(CreateInvoiceParameter parameter);

  Future<InvoiceDetailsModel> getInvoiceDetails(
      InvoiceDetailsParameter parameter);
}

class InvoiceDataSource extends BaseInvoiceDataSource {
  Options options = Options(
    method: 'GET',
    headers: {
      'Authorization': 'Bearer ${SharedPrefController().getUser().accessToken}'
    },
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
          "email": "hebaskhail@gmail.com",
          "password": "Heba@123456",
        },
      );

      if (response.statusCode == 200) {
        SharedPrefController().save(UserModel.fromJson(response.data["data"]));
        return response;
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      Helper.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

  @override
  Future<String> createInvoice(CreateInvoiceParameter parameter) async {
    var clientData = parameter.createInvoiceEntities.client;
    var fixedData = parameter.createInvoiceEntities.fixed;
    List<FixedEntities> fixedList = [
      FixedEntities(
          itemName: fixedData!.first.itemName.toString().trim(),
          description: fixedData.first.description,
          price: fixedData.first.price),
      // FixedEntities(
      //     itemName: fixedData.last.itemName.toString().trim(),
      //     description: fixedData.last.description,
      //     price: fixedData.last.price),
    ];

    final response = await BaseClient().post(
      EndPoints.createInvoice,
      options: Options(
        headers: {'Authorization': 'Bearer ${parameter.token}'},
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
      data: {
        "client": {
          "firstName": clientData!.firstName,
          "lastName": clientData.lastName,
          "email": clientData.email,
          "address": {"country": clientData.address.country}
        },
        "fixed": fixedList,
        "currency": parameter.currency
      },
    );

    if (response.statusCode == 200) {
      return response.data['data']['_id'];
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel(response.toString()),
      );
    }
  }

  @override
  Future<InvoiceDetailsModel> getInvoiceDetails(
      InvoiceDetailsParameter parameter) async {
    final response = await BaseClient().get(
      EndPoints.getInvoice(parameter.id.toString()),
      options: options,
    );

    // print("API Response : ${response.data['data']}");

    if (response.statusCode == 200) {
      // print("API Response : ${response.data}");
      return InvoiceDetailsModel.fromJson(response.data['data']['invoice']);
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel(response.toString()),
      );
    }
  }
}
