import 'package:get_it/get_it.dart';

import 'package:invoice_system/data/datasource/invoice_data_source.dart';
import 'package:invoice_system/data/repository/invoice_repository.dart';
import 'package:invoice_system/domain/repository/base_invoice_repository.dart';
import 'package:invoice_system/domain/usecase/invoice_list_usecase.dart';
import 'package:invoice_system/presentation/controller/invoice_bloc/invoice_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc New Obj
    getIt.registerFactory(
      () => InvoiceBloc(
        getIt(),
      ),
    );


    /// Data Source
    getIt.registerLazySingleton<BaseInvoiceDataSource>(
        () => InvoiceDataSource());

    /// Repository
    getIt.registerLazySingleton<BaseInvoiceRepository>(
        () => InvoiceRepository((getIt())));

    /// Use Case
    getIt.registerLazySingleton<InvoiceListUseCase>(
        () => InvoiceListUseCase(getIt()));
  }
}
