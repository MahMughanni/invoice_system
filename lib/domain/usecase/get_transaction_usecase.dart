import 'package:dartz/dartz.dart';
import 'package:invoice_system/core/error/failure.dart';
import 'package:invoice_system/domain/entities/transactions_entities.dart';
import 'package:invoice_system/domain/repository/base_invoice_repository.dart';

import '../../core/base_usecase/base_usecase.dart';

class GetTransactionUseCase
    extends BaseUseCase<List<TransactionsEntities>, TransactionParameter> {
  BaseInvoiceRepository baseInvoiceRepository;

  GetTransactionUseCase(this.baseInvoiceRepository);

  @override
  Future<Either<Failure, List<TransactionsEntities>>> call(
      TransactionParameter parameters) async {
    return await baseInvoiceRepository.getTransaction(parameters);
  }
}

class TransactionParameter {
  final String type;

  TransactionParameter({required this.type});
}
