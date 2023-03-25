import 'package:dartz/dartz.dart';

import 'package:invoice_system/core/error/failure.dart';
import 'package:invoice_system/domain/repository/base_invoice_repository.dart';

import '../../core/base_usecase/base_usecase.dart';
import '../entities/service_entities/service_entities.dart';

class CreateServiceUseCase extends BaseUseCase<String, CreateServiceParameter> {
  BaseInvoiceRepository baseInvoiceRepository;

  CreateServiceUseCase(this.baseInvoiceRepository);

  @override
  Future<Either<Failure, String>> call(
      CreateServiceParameter parameters) async {
    return await baseInvoiceRepository.createNewService(parameters);
  }
}

class CreateServiceParameter {
  NewServiceEntities newServiceEntities;

  final String token;


  @override
  String toString() {
    return 'CreateServiceParameter{newServiceEntities: $newServiceEntities, token: $token}';
  }

  CreateServiceParameter({
    required this.newServiceEntities,
    required this.token,
  });
}
