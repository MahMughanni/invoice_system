import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_system/core/base_usecase/base_usecase.dart';
import 'package:invoice_system/domain/entities/invoice_entities.dart';
import 'package:invoice_system/domain/usecase/invoice_list_usecase.dart';
import 'package:invoice_system/utils/enums/request_state.dart';
import 'package:meta/meta.dart';

part 'invoice_event.dart';

part 'invoice_state.dart';

class InvoiceBloc extends Bloc<GetInvoiceEvent, InvoiceInitialState> {
  InvoiceListUseCase invoiceListUseCase;

  InvoiceBloc(this.invoiceListUseCase) : super(const InvoiceInitialState()) {
    on<GetInvoiceEvent>(_getAllInvoices);
  }

  FutureOr<void> _getAllInvoices(
      GetInvoiceEvent event, Emitter<InvoiceInitialState> emit) async {
    final response = await invoiceListUseCase(NoParameters());

    response.fold(
        (l) => emit(state.copyWith(
              requestState: RequestState.error,
            )), (r) {
      // print(r);
      emit(state.copyWith(
        invoiceList: r,
        requestState: RequestState.loaded,
      ));
    });
  }
}
