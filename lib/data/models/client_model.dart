import 'package:invoice_system/domain/entities/client_entities.dart';

class ClientModel extends ClientEntities {
  ClientModel({
    required super.firstName,
    required super.lastName,
    required super.email,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
