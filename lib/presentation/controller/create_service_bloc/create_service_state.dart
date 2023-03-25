part of 'create_service_bloc.dart';

abstract class CreateServiceState extends Equatable {
  const CreateServiceState();

  @override
  List<Object?> get props => [];
}

class CreateServiceInitial extends CreateServiceState {}

class CreateServiceLoading extends CreateServiceState {}

class CreateServiceSuccess extends CreateServiceState {
  final String response;

  final List<Widget> servesList;
  int counter;

  CreateServiceSuccess({
    this.counter= 0 ,
    this.response = '',
    this.servesList = const [],
  });

  CreateServiceSuccess copyWIth({
    List<Widget>? servesList,
    String? response,
    int? counter,
  }) {
    return CreateServiceSuccess(
      servesList: servesList!.length != 2 ? servesList : this.servesList,
      response: response ?? this.response,
      counter: counter ?? this.counter,
    );
  }

  @override
  List<Object?> get props => [response];
}

class CreateServiceError extends CreateServiceState {
  final String errorMessage;

  const CreateServiceError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class CreateServiceValidationFailed extends CreateServiceState {
  final String errorMessage;

  const CreateServiceValidationFailed(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
