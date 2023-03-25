import 'package:dartz/dartz.dart';
import 'package:invoice_system/core/base_usecase/base_usecase.dart';
import 'package:invoice_system/core/error/failure.dart';
import 'package:invoice_system/domain/entities/service_entities.dart';
import 'package:invoice_system/domain/repository/base_invoice_repository.dart';

class GetServiceUseCase
    extends BaseUseCase<List<ServiceEntities>, NoParameters> {
  BaseInvoiceRepository baseInvoiceRepository;

  GetServiceUseCase(this.baseInvoiceRepository);

  @override
  Future<Either<Failure, List<ServiceEntities>>> call(
      NoParameters parameters) async {
    return await baseInvoiceRepository.getServiceList(parameters);
  }
}
