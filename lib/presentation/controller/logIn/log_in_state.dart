part of 'log_in_bloc.dart';

@immutable
abstract class LogInBlocState {}

class LoginInitial extends LogInBlocState {}

class LoginSuccess extends LogInBlocState {}

class LoginLoading extends LogInBlocState {}

class LoginFailure extends LogInBlocState {}
