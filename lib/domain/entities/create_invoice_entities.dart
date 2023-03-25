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

  @override
  String toString() {
    return 'CreateInvoiceEntities{client: $client, fixed: $fixed, currency: $currency, id: $id}';
  }
}

class CreateClientEntities {
  late final String fullName;
  late final String email;
  late final AddressEntities address;

  CreateClientEntities({
    required this.fullName,
    required this.email,
    required this.address,
  });

  @override
  String toString() {
    return 'CreateClientEntities{fullName: $fullName, email: $email, address: $address}';
  }
}
