import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:invoice_system/core/base_usecase/base_usecase.dart';
import 'package:invoice_system/core/error/failure.dart';
import 'package:invoice_system/domain/repository/base_invoice_repository.dart';

class ChangeStatusUseCase extends BaseUseCase<Response, ChangeStatusParameter> {
  BaseInvoiceRepository baseInvoiceRepository;

  ChangeStatusUseCase(this.baseInvoiceRepository);

  @override
  Future<Either<Failure, Response>> call(
      ChangeStatusParameter parameters) async {
    return await baseInvoiceRepository.changeStateById(parameters);
  }
}

class ChangeStatusParameter {
  final String id;

  ChangeStatusParameter({required this.id});
}
