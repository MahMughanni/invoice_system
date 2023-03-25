import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../domain/entities/service_entities.dart';
import '../../../domain/usecase/get_service_usecase.dart';

part 'service_event.dart';

part 'service_state.dart';

class ServiceBloc extends Bloc<InvoiceServiceEvent, ServiceInitialState> {
  GetServiceUseCase getServiceUseCase;

  ServiceBloc(this.getServiceUseCase) : super(ServiceInitialState()) {
    on<GetServiceEvent>(_getServiceList);
  }

  FutureOr<void> _getServiceList(
      GetServiceEvent event, Emitter<ServiceInitialState> emit) async {
    final response = await getServiceUseCase(NoParameters());

    response.fold((l) => emit(state), (r) {
      // print(r);
      emit(
        state.copyWith(serviceList: r),
      );
    });
  }
}
