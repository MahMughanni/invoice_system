part of 'invoice_bloc.dart';

class InvoiceInitialState extends Equatable {
  final List<InvoiceEntities> invoiceList;
  final RequestState requestState;

  const InvoiceInitialState({
    this.invoiceList = const [],
    this.requestState = RequestState.loading,
  });

  InvoiceInitialState copyWith({
    List<InvoiceEntities>? invoiceList,
    RequestState? requestState,
  }) {
    return InvoiceInitialState(
        invoiceList: invoiceList ?? this.invoiceList,
        requestState: requestState ?? this.requestState);
  }


  @override
  List<Object?> get props => [invoiceList];
}
