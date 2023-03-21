import 'package:dartz/dartz.dart';
import 'package:invoice_system/core/error/exception.dart';
import 'package:invoice_system/core/error/failure.dart';
import 'package:invoice_system/data/datasource/invoice_data_source.dart';
import 'package:invoice_system/domain/entities/invoice_entities.dart';
import 'package:invoice_system/domain/repository/base_invoice_repository.dart';

class InvoiceRepository extends BaseInvoiceRepository {
  BaseInvoiceDataSource baseInvoiceDataSource;

  InvoiceRepository(this.baseInvoiceDataSource);

  @override
  Future<Either<Failure, List<InvoiceEntities>>> getInvoiceList() async {
    final response = await baseInvoiceDataSource.getAllInvoices();
    try {
      return Right(response);
    } on ServerExceptions catch (error) {
      return Left(ServerFailure(error.errorMessageModel.error.toString()));
    }
  }


}
