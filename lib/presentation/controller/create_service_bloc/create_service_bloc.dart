import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/usecase/create_Service_usecase.dart';
import '../../screens/invoice_flow/create_invoice.dart';
import '../create_invoice_bloc/create_invoice_bloc.dart';

part 'create_service_event.dart';

part 'create_service_state.dart';

class CreateServiceBloc
    extends Bloc<CreateServiceRequested, CreateServiceSuccess> {
  final CreateServiceUseCase createServiceUseCase;

  CreateServiceBloc(this.createServiceUseCase)
      : super(CreateServiceSuccess()) {
    on<CreateServiceRequested>(_createService);
  }

  void increment() {
    emit(
      CreateServiceSuccess(
        counter: state.counter++ ,
        servesList: List.from(state.servesList)
          ..add(
            ContentToAddService(),
          ),
      ),
    );
  }

  void delete(int index) => emit(
        CreateServiceSuccess(
          counter: state.counter--,
          servesList: List.from(state.servesList)..removeAt(index),
        ),
      );

  FutureOr<void> _createService(
      CreateServiceRequested event, Emitter<CreateServiceState> emit) async {
    final response = await createServiceUseCase(CreateServiceParameter(
        newServiceEntities: event.parameter.newServiceEntities,
        token: event.parameter.token));

    response.fold(
      (l) => emit(CreateServiceError(l.message.toString())),
      (r) => emit(
        CreateServiceSuccess(response: r, counter: 0),
      ),
    );
  }
}
