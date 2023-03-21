import 'package:dio/dio.dart';
import 'package:invoice_system/data/models/invoice_model.dart';

import '../../core/error/exception.dart';
import '../../core/network/api_constants.dart';

abstract class BaseInvoiceDataSource {
  Future<List<InvoiceModel>> getAllInvoices();

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
  Future<List<InvoiceModel>> getAllInvoices() async {
    var response =
        await Dio().get(EndPoints.getInvoiceListing, options: options);

    // print(response.data['data']['invoices']);
    if (response.statusCode == 200) {
      return List<InvoiceModel>.from((response.data['data']['invoices'] as List)
          .map((e) => InvoiceModel.fromJson(e))).toList();
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel(response.data.toString()),
      );
    }
  }

}
