import 'package:invoice_system/domain/entities/address_entities.dart';
import 'package:invoice_system/domain/entities/client_entities.dart';
import 'package:invoice_system/domain/entities/fixed_entities.dart';

class CreateInvoiceEntities {
  CreateClientEntities? client;
  List<FixedEntities>? fixed;
  String? currency;
  final String? id;

  CreateInvoiceEntities({
    this.client,
    this.fixed,
    this.currency,
    this.id,
  });
}

class CreateClientEntities {
  late final String firstName;
  late final String lastName;
  late final String email;
  late final AddressEntities address;

  CreateClientEntities({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
  });
}
