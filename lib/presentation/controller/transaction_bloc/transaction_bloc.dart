import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:invoice_system/presentation/controller/transaction_bloc/transaction_state.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecase/get_transaction_usecase.dart';

part 'transaction_event.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  GetTransactionUseCase getTransactionUseCase;

  TransactionBloc(this.getTransactionUseCase) : super(TransactionState()) {
    on<TransactionEvent>(_getTransactions);
  }

  FutureOr<void> _getTransactions(
      TransactionEvent event, Emitter<TransactionState> emit) async {
    final response =
        await getTransactionUseCase(TransactionParameter(type: event.type));

    response.fold(
      (l) => emit(state),
      (r) => emit(
        state.copyWith(transactionLis: r),
      ),
    );
  }
}
