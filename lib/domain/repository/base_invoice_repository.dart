import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:invoice_system/core/base_usecase/base_usecase.dart';
import 'package:invoice_system/core/error/failure.dart';
import 'package:invoice_system/data/models/invoice_details_model.dart';
import 'package:invoice_system/domain/entities/client_entities.dart';
import 'package:invoice_system/domain/entities/invoice_entities.dart';
import 'package:invoice_system/domain/entities/service_entities.dart';

import '../entities/create_invoice_entities.dart';
import '../entities/transactions_entities.dart';
import '../usecase/change_status_usecase.dart';
import '../usecase/create_new_invoice_usecase.dart';
import '../usecase/get_transaction_usecase.dart';
import '../usecase/invoice_details_usecase.dart';
import '../usecase/invoice_list_usecase.dart';
import '../usecase/login_usecase.dart';

abstract class BaseInvoiceRepository {
  Future<Either<Failure, List<InvoiceEntities>>> getInvoiceList(
      InvoiceParameter token);

  Future<Either<Failure, Response>> login(LoginParameter parameter);

  Future<Either<Failure, String>> createNewInvoice(
      CreateInvoiceParameter parameter);

  Future<Either<Failure, InvoiceDetailsModel>> getInvoiceDetails(
      InvoiceDetailsParameter parameter);

  Future<Either<Failure, List<TransactionsEntities>>> getTransaction(
      TransactionParameter parameter);

  Future<Either<Failure, List<ServiceEntities>>> getServiceList(
      NoParameters parameter);

  Future<Either<Failure, Response>> changeStateById(ChangeStatusParameter parameter);
}
