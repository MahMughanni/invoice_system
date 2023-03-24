import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_system/core/base_usecase/base_usecase.dart';
import 'package:invoice_system/core/error/failure.dart';
import 'package:invoice_system/domain/entities/fixed_entities.dart';
import 'package:invoice_system/domain/repository/base_invoice_repository.dart';

import '../entities/create_invoice_entities.dart';

class CreateNewInvoiceUseCase
    extends BaseUseCase<String, CreateInvoiceParameter> {
  BaseInvoiceRepository baseInvoiceRepository;

  CreateNewInvoiceUseCase(this.baseInvoiceRepository);

  @override
  Future<Either<Failure, String>> call(
      CreateInvoiceParameter parameters) async {
    return await baseInvoiceRepository.createNewInvoice(parameters);
  }
}

class CreateInvoiceParameter extends Equatable {
  final String currency, token;
  final CreateInvoiceEntities createInvoiceEntities;

  const CreateInvoiceParameter({
    required this.token,
    required this.currency,
    required this.createInvoiceEntities,
  });

  @override
  List<Object> get props => [currency, createInvoiceEntities];
}
