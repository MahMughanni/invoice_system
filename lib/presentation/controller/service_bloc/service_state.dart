part of 'service_bloc.dart';

@immutable
abstract class InvoiceServiceState {}

class ServiceInitialState extends InvoiceServiceState {
  final List<ServiceEntities> serviceList;

  ServiceInitialState({
    this.serviceList = const [],
  });

  ServiceInitialState copyWith({
    List<ServiceEntities>? serviceList,
  }) {
    return ServiceInitialState(
      serviceList: serviceList ?? this.serviceList,
    );
  }
}
