part of 'invoice_bloc.dart';

abstract class GetInvoiceLinkEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetInvoiceEvent extends GetInvoiceLinkEvent {
  String token;

  GetInvoiceEvent(this.token);
}


class GetServiceEvent extends GetInvoiceLinkEvent {

}