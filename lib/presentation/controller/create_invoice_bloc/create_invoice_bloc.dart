import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:invoice_system/domain/entities/create_invoice_entities.dart';
import 'package:invoice_system/domain/usecase/create_new_invoice_usecase.dart';
import 'package:meta/meta.dart';

part 'create_invoice_event.dart';

part 'create_invoice_state.dart';

class CreateInvoiceBloc extends Bloc<CreateEvent, CreateInvoiceSuccess> {
  CreateNewInvoiceUseCase createNewInvoiceUseCase;

  int counter = 0;

  CreateInvoiceBloc(
    this.createNewInvoiceUseCase,
  ) : super(CreateInvoiceSuccess()) {
    on<CreateInvoiceEvent>(createInvoice);
    on<AddFixedEvent>(_addFixedEvent);
  }

  FutureOr<void> createInvoice(
      CreateInvoiceEvent event, Emitter<CreateInvoiceState> emit) async {
    final response = await createNewInvoiceUseCase(CreateInvoiceParameter(
        token: event.token,
        currency: event.currency,
        createInvoiceEntities: event.createInvoiceEntities));

    response.fold((l) => null, (r) {
      emit(
        state.copyWIth(
          id: r,
          servesList: state.servesList,
        ),
      );
    });
  }

  FutureOr<void> _addFixedEvent(
      AddFixedEvent event, Emitter<CreateInvoiceState> emit) async {
    final List<Widget> addToList = List.from((state).servesList);

    emit(
      CreateInvoiceSuccess(
        servesList: addToList,
      ),
    );
  }
}
