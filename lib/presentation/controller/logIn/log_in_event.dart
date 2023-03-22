part of 'log_in_bloc.dart';

@immutable
abstract class LogInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginBlocEvent extends LogInEvent {
  String email, password;

  LoginBlocEvent({required this.email, required this.password});
}
