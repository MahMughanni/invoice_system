import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecase/invoice_list_usecase.dart';

part 'test_event.dart';

part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  InvoiceListUseCase invoiceListUseCase;

  TestBloc(this.invoiceListUseCase) : super(TestInitial()) {
    on((event, emit) => null);
    on<TestEvent>((event, emit) {});
  }
}
