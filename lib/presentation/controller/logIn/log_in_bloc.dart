import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:invoice_system/domain/usecase/login_usecase.dart';
import 'package:meta/meta.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

class LogInBloc extends Bloc<LoginBlocEvent, LogInBlocState> {
  LoginUseCase loginUseCase;

  LogInBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginBlocEvent>(_login);
  }

  FutureOr<void> _login(
      LoginBlocEvent event, Emitter<LogInBlocState> emit) async {
    final response = await loginUseCase(
        LoginParameter(email: event.email, password: event.password));
    response.fold(
      (l) => emit(
        LoginLoading(),
      ),
      (r) {
        // print(r);
        emit(LoginSuccess());
      },
    );
  }
}
