part of 'create_invoice_bloc.dart';

@immutable
abstract class CreateInvoiceState extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateInvoiceInitial extends CreateInvoiceState {}

class CreateInvoiceSuccess extends CreateInvoiceInitial {
  List<Widget> servesList;
  String id;

  CreateInvoiceSuccess({
    this.id = '',
    this.servesList = const [],
  });

  CreateInvoiceSuccess copyWIth({
    List<Widget>? servesList,
    String? id,
  }) {
    return CreateInvoiceSuccess(
      servesList: servesList!.length != 2 ? servesList : this.servesList,
      id: id ?? this.id,
    );
  }
}

class CreateInvoiceLoading extends CreateInvoiceInitial {}

class CreateInvoiceFailure extends CreateInvoiceInitial {}
