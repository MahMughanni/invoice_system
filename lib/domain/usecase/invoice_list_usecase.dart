import 'package:dartz/dartz.dart';
import 'package:invoice_system/core/base_usecase/base_usecase.dart';
import 'package:invoice_system/core/error/failure.dart';
import 'package:invoice_system/domain/entities/invoice_entities.dart';
import 'package:invoice_system/domain/repository/base_invoice_repository.dart';

class InvoiceListUseCase
    extends BaseUseCase<List<InvoiceEntities>, NoParameters> {
  BaseInvoiceRepository baseInvoiceRepository;

  InvoiceListUseCase(this.baseInvoiceRepository);

  @override
  Future<Either<Failure, List<InvoiceEntities>>> call(
      NoParameters parameters) async {
    return baseInvoiceRepository.getInvoiceList();
  }
}
