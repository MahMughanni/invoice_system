part of 'create_invoice_bloc.dart';

@immutable
abstract class CreateEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class IncrementEvent extends CreateEvent {}

class CreateInvoiceEvent extends CreateEvent {
  CreateInvoiceEntities createInvoiceEntities;

  // CreateClientEntities createClientEntities;
  // List<FixedEntities> fixedEntities;

  String currency, token;

  CreateInvoiceEvent({
    required this.createInvoiceEntities,
    required this.currency,
    required this.token,
  });
}

class AddFixedEvent extends CreateEvent {
  List<Widget> fixedEntities;
  int counter;

  AddFixedEvent({required this.fixedEntities, this.counter = 0});
}
