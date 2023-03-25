import 'package:invoice_system/domain/entities/transactions_entities.dart';

class TransactionState {
  List<TransactionsEntities> transactionLis;

  TransactionState({
    this.transactionLis = const [],
  });

  TransactionState copyWith({
    List<TransactionsEntities>? transactionLis,
  }) {
    return TransactionState(
        transactionLis: transactionLis ?? this.transactionLis);
  }
}
