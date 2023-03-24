import 'package:dartz/dartz.dart';
import 'package:dio/src/response.dart';
import 'package:invoice_system/core/base_usecase/base_usecase.dart';
import 'package:invoice_system/core/error/exception.dart';
import 'package:invoice_system/core/error/failure.dart';
import 'package:invoice_system/data/datasource/invoice_data_source.dart';
import 'package:invoice_system/domain/entities/client_entities.dart';
import 'package:invoice_system/domain/entities/create_invoice_entities.dart';
import 'package:invoice_system/domain/entities/invoice_entities.dart';
import 'package:invoice_system/domain/repository/base_invoice_repository.dart';
import 'package:invoice_system/domain/usecase/create_new_invoice_usecase.dart';
import 'package:invoice_system/domain/usecase/invoice_details_usecase.dart';
import 'package:invoice_system/domain/usecase/login_usecase.dart';

import '../../domain/usecase/invoice_list_usecase.dart';
import '../models/invoice_details_model.dart';

class InvoiceRepository extends BaseInvoiceRepository {
  BaseInvoiceDataSource baseInvoiceDataSource;

  InvoiceRepository(this.baseInvoiceDataSource);

  @override
  Future<Either<Failure, List<InvoiceEntities>>> getInvoiceList(
      InvoiceParameter token) async {
    final response = await baseInvoiceDataSource.getAllInvoices(token);
    try {
      return right(response);
    } on ServerExceptions catch (error) {
      return Left(ServerFailure(error.errorMessageModel.error.toString()));
    }
  }

  @override
  Future<Either<Failure, Response>> login(LoginParameter parameter) async {
    final response = await baseInvoiceDataSource.login(parameter);
    try {
      return right(response);
    } on ServerExceptions catch (error) {
      return Left(ServerFailure(error.errorMessageModel.error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createNewInvoice(
      CreateInvoiceParameter parameter) async {
    final response = await baseInvoiceDataSource.createInvoice(parameter);
    try {
      return right(response);
    } on ServerExceptions catch (error) {
      return Left(ServerFailure(error.errorMessageModel.error.toString()));
    }
  }

  @override
  Future<Either<Failure, InvoiceDetailsModel>> getInvoiceDetails(
      InvoiceDetailsParameter parameter) async {
    final response = await baseInvoiceDataSource.getInvoiceDetails(parameter);
    try {
      return right(response);
    } on ServerExceptions catch (error) {
      return Left(ServerFailure(error.errorMessageModel.error.toString()));
    }
  }
}
