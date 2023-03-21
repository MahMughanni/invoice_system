import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:invoice_system/presentation/screens/main_screen.dart';

import 'core/error/exception.dart';
import 'core/network/api_cosntants.dart';
import 'data/models/invoice_model.dart';

void main() {
  runApp(const MyApp());
  _getInvoice();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

Future<List<InvoiceModel>> _getInvoice() async {
  Options options = Options(
    method: 'GET',
    headers: {'Authorization': 'Bearer ${EndPoints.token}'},
    validateStatus: (_) => true,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  );

  var response = await Dio().get(EndPoints.getInvoiceListing, options: options);

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
