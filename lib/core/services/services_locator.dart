import 'package:get_it/get_it.dart';

import 'package:invoice_system/data/datasource/invoice_data_source.dart';
import 'package:invoice_system/data/repository/invoice_repository.dart';
import 'package:invoice_system/domain/repository/base_invoice_repository.dart';
import 'package:invoice_system/domain/usecase/create_new_invoice_usecase.dart';
import 'package:invoice_system/domain/usecase/invoice_details_usecase.dart';
import 'package:invoice_system/domain/usecase/invoice_list_usecase.dart';
import 'package:invoice_system/domain/usecase/login_usecase.dart';
import 'package:invoice_system/presentation/controller/create_invoice_bloc/create_invoice_bloc.dart';
import 'package:invoice_system/presentation/controller/invoice_bloc/invoice_bloc.dart';
import 'package:invoice_system/presentation/controller/invoice_details_bloc/invoice_details_bloc.dart';
import 'package:invoice_system/presentation/controller/logIn/log_in_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc New Obj
    getIt.registerFactory(
      () => InvoiceBloc(
        getIt(),
      ),
    );
    getIt.registerFactory(
      () => LogInBloc(
        getIt(),
      ),
    );
    getIt.registerFactory(
      () => CreateInvoiceBloc(
        getIt(),
      ),
    );

    getIt.registerFactory(
      () => InvoiceDetailsBloc(
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

    getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));

    getIt.registerLazySingleton<CreateNewInvoiceUseCase>(
        () => CreateNewInvoiceUseCase(getIt()));

    getIt.registerLazySingleton<GetInvoiceDetailsUseCase>(
        () => GetInvoiceDetailsUseCase(getIt()));
  }
}
