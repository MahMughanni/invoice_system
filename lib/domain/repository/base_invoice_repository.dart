import 'package:dartz/dartz.dart';
import 'package:invoice_system/core/error/failure.dart';
import 'package:invoice_system/domain/entities/invoice_entities.dart';

abstract class BaseInvoiceRepository {
  Future<Either<Failure, List<InvoiceEntities>>> getInvoiceList();

}
