part of 'invoice_details_bloc.dart';

class InvoiceDetailsState extends Equatable {
  InvoiceDetailsModel invoiceDetailsModel;

  InvoiceDetailsState({this.invoiceDetailsModel = const InvoiceDetailsModel()});

  InvoiceDetailsState copyWith({
    InvoiceDetailsModel? invoiceDetailsModel,
  }) {
    return InvoiceDetailsState(
      invoiceDetailsModel: invoiceDetailsModel ?? this.invoiceDetailsModel,
    );
  }

  @override
  List<Object?> get props => [];
}

class FieldStatus extends InvoiceDetailsState {}
