import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_system/data/models/invoice_details_model.dart';
import 'package:invoice_system/domain/usecase/invoice_details_usecase.dart';

part 'invoice_details_event.dart';

part 'invoice_details_state.dart';

class InvoiceDetailsBloc extends Bloc<InvoiceDetailsEvent, InvoiceDetailsState> {
  GetInvoiceDetailsUseCase getInvoiceDetailsUseCase;

  InvoiceDetailsBloc(this.getInvoiceDetailsUseCase)
      : super(
          InvoiceDetailsState(),
        ) {
    on<InvoiceDetailsEvent>(_getInvoiceDetails);
  }

  FutureOr<void> _getInvoiceDetails(
      InvoiceDetailsEvent event, Emitter<InvoiceDetailsState> emit) async {
    final response =
        await getInvoiceDetailsUseCase(InvoiceDetailsParameter(event.id));

    response.fold(
      (l) => emit(
        FieldStatus(),
      ),
      (r) => emit(
        state.copyWith(invoiceDetailsModel: r),
      ),
    );
  }
}
