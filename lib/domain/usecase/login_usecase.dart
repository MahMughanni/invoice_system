import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:invoice_system/core/error/failure.dart';
import 'package:invoice_system/domain/repository/base_invoice_repository.dart';

import '../../core/base_usecase/base_usecase.dart';

class LoginUseCase extends BaseUseCase<Response, LoginParameter> {
  BaseInvoiceRepository baseInvoiceRepository;

  LoginUseCase(this.baseInvoiceRepository);

  @override
  Future<Either<Failure, Response>> call(LoginParameter parameters) async {
    return baseInvoiceRepository.login(parameters);
  }
}

class LoginParameter {
  final String email, password;

  LoginParameter({required this.email, required this.password});
}
