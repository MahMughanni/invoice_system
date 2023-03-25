part of 'invoice_bloc.dart';

class InvoiceSeccsuesState extends Equatable {
  @override
  List<Object> get props => [invoiceList, requestState];


  final List<InvoiceEntities> invoiceList;
  final RequestState requestState;

  InvoiceSeccsuesState({
    this.invoiceList = const [],
    this.requestState = RequestState.loading,
  });

  InvoiceSeccsuesState copyWith({
    List<InvoiceEntities>? invoiceList,
    RequestState? requestState,
  }) {
    return InvoiceSeccsuesState(
        invoiceList: invoiceList ?? this.invoiceList,
        requestState: requestState ?? this.requestState);
  }
}

