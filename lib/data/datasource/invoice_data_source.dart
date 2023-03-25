import 'package:dio/dio.dart';
import 'package:invoice_system/core/base_usecase/base_usecase.dart';
import 'package:invoice_system/core/network/base_client.dart';
import 'package:invoice_system/data/models/create_invoice_model.dart';
import 'package:invoice_system/data/models/invoice_details_model.dart';
import 'package:invoice_system/data/models/invoice_model.dart';
import 'package:invoice_system/domain/entities/create_invoice_entities.dart';
import 'package:invoice_system/domain/entities/fixed_entities.dart';
import 'package:invoice_system/domain/entities/service_entities.dart';
import 'package:invoice_system/domain/entities/transactions_entities.dart';
import 'package:invoice_system/domain/usecase/create_Service_usecase.dart';
import 'package:invoice_system/domain/usecase/create_new_invoice_usecase.dart';
import 'package:invoice_system/domain/usecase/get_transaction_usecase.dart';
import 'package:invoice_system/domain/usecase/invoice_details_usecase.dart';
import 'package:invoice_system/presentation/controller/localData/shared_perf.dart';
import 'package:invoice_system/utils/helper.dart';

import '../../core/error/exception.dart';
import '../../core/network/api_constants.dart';
import '../../core/network/app_exception.dart';
import '../../domain/usecase/change_status_usecase.dart';
import '../../domain/usecase/invoice_list_usecase.dart';
import '../../domain/usecase/login_usecase.dart';
import '../models/user_model.dart';

abstract class BaseInvoiceDataSource {
  Future<List<InvoiceModel>> getAllInvoices(InvoiceParameter parameter);

  Future login(LoginParameter parameter);

  Future<String> createInvoice(CreateInvoiceParameter parameter);

  Future<String> createService(CreateServiceParameter parameter);

  Future<InvoiceDetailsModel> getInvoiceDetails(
      InvoiceDetailsParameter parameter);

  Future<List<TransactionsEntities>> getTransaction(
      TransactionParameter parameter);

  Future<List<ServiceEntities>> getServiceList(NoParameters parameter);

  Future<Response> changeStatusById(ChangeStatusParameter parameter);
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
  Future<List<TransactionsEntities>> getTransaction(
      TransactionParameter parameter) async {
    final response = await BaseClient().get(
      '${EndPoints.getTransactions}?type=$parameter',
      options: Options(
        headers: {
          'Authorization':
              'Bearer ${SharedPrefController().getUser().accessToken}'
        },
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
    if (response.statusCode == 200) {
      print(response.data['data']['transactions']);
      return List.from((response.data['data']['transactions'] as List)
          .map((e) => TransactionsEntities.fromJson(e)));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<List<ServiceEntities>> getServiceList(NoParameters parameter) async {
    try {
      final response =
          await BaseClient().get(EndPoints.getServiceListing, options: options);
      final data = response.data['data']['services'] as List;
      return data.map((json) => ServiceEntities.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch services: $e');
    }
  }

  @override
  Future<InvoiceDetailsModel> getInvoiceDetails(
      InvoiceDetailsParameter parameter) async {
    final response = await BaseClient().get(
      EndPoints.getInvoiceById(parameter.id.toString()),
      options: options,
    );
    // print("API Response : ${response.data['data']}");

    if (response.statusCode == 200) {
      return InvoiceDetailsModel.fromJson(response.data['data']['invoice']);
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel(response.toString()),
      );
    }
  }

  @override
  Future<Response> changeStatusById(ChangeStatusParameter parameter) async {
    final response = BaseClient().post(
      EndPoints.changeStatusById(parameter.id),
      queryParameters: {"id": parameter.id},
    );
    print(response);

    return response;
  }

  @override
  Future<String> createInvoice(CreateInvoiceParameter parameter) async {
    var clientData = parameter.createInvoiceEntities.client;
    var fixedData = parameter.createInvoiceEntities.fixed;

    List<FixedEntities> fixedList = fixedData!
        .map(
          (fixedItem) => FixedEntities(
              itemName: fixedItem.itemName.toString() ?? '',
              description: fixedItem.description.toString() ?? '',
              price: fixedItem.price ?? 0),
        )
        .toList();

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
          "fullName": clientData?.fullName ?? '',
          "email": clientData?.email ?? '',
          "address": {
            "country": parameter.createInvoiceEntities.client!.address.country
          }
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
  Future<String> createService(CreateServiceParameter parameter) async {
    try {
      var fixed = parameter.newServiceEntities.fixed;
      var currency = parameter.newServiceEntities.currency;

      List<FixedEntities> fixedList = fixed!
          .map(
            (fixedItem) => FixedEntities(
                itemName: fixedItem.itemName.toString() ?? '',
                description: fixedItem.description.toString() ?? '',
                price: fixedItem.price ?? 0),
          )
          .toList();

      final response = await BaseClient().post(EndPoints.createService,
          options: Options(
            headers: {'Authorization': 'Bearer ${parameter.token}'},
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ),
          data: {
            'fixed': [

            ],
            'currency': currency,
          });

      if (response.statusCode == 200) {
        return response.data['data']['_id'];
      } else {
        throw ServerExceptions(
          errorMessageModel: ErrorMessageModel(response.toString()),
        );
      }
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
}
