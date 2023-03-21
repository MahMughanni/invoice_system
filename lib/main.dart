import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_system/presentation/controller/invoice_bloc/invoice_bloc.dart';
import 'package:invoice_system/presentation/screens/main_screen.dart';

import 'core/services/services_locator.dart';

void main() {
  // getTransaction();

  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            lazy: true,
            create: (context) => getIt<InvoiceBloc>()
              ..add(
                GetInvoiceEvent(),
              )),
      ],
      child: const MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}

// Future<List<TransactionModel>> getTransaction() async {
//   Options options = Options(
//     method: 'GET',
//     headers: {'Authorization': 'Bearer ${EndPoints.token}'},
//     validateStatus: (_) => true,
//     contentType: Headers.jsonContentType,
//     responseType: ResponseType.json,
//   );
//   var response = await Dio().get(EndPoints.getTransactions, options: options);
//
//   // print(response.data['data']['transactions']);
//   if (response.statusCode == 200) {
//     return List<TransactionModel>.from(
//             (response.data['data']['transactions'] as List).map((e) => TransactionModel.fromJson(e)))
//         .toList();
//   } else {
//     throw ServerExceptions(
//       errorMessageModel: ErrorMessageModel(response.data.toString()),
//     );
//   }
// }
