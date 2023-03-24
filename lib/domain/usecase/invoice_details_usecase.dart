import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_system/core/base_usecase/base_usecase.dart';
import 'package:invoice_system/core/error/failure.dart';
import 'package:invoice_system/data/models/invoice_details_model.dart';
import 'package:invoice_system/domain/repository/base_invoice_repository.dart';

class GetInvoiceDetailsUseCase
    extends BaseUseCase<InvoiceDetailsModel, InvoiceDetailsParameter> {
  BaseInvoiceRepository baseInvoiceRepository;

  GetInvoiceDetailsUseCase(this.baseInvoiceRepository);

  @override
  Future<Either<Failure, InvoiceDetailsModel>> call(
      InvoiceDetailsParameter parameters) async {
    return await baseInvoiceRepository.getInvoiceDetails(parameters);
  }
}

class InvoiceDetailsParameter extends Equatable {
  final String id;

  @override
  List<Object> get props => [];

  const InvoiceDetailsParameter(this.id);
}
