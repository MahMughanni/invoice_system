import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:invoice_system/core/error/failure.dart';
import 'package:invoice_system/domain/entities/invoice_entities.dart';

import '../usecase/invoice_list_usecase.dart';
import '../usecase/login_usecase.dart';

abstract class BaseInvoiceRepository {
  Future<Either<Failure, List<InvoiceEntities>>> getInvoiceList(
      InvoiceParameter token);

  Future<Either<Failure, Response>> login(LoginParameter parameter);
}
