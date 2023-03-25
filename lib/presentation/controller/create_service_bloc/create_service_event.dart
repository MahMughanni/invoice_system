part of 'create_service_bloc.dart';

abstract class CreateServiceEvent extends Equatable {
  const CreateServiceEvent();

  @override
  List<Object?> get props => [];
}

class CreateServiceRequested extends CreateServiceEvent {
  final CreateServiceParameter parameter;

  CreateServiceRequested({required this.parameter});

  @override
  List<Object?> get props => [parameter];
}

class CreateServiceCancelled extends CreateServiceEvent {}
