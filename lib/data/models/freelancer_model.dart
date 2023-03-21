import 'package:invoice_system/domain/entities/freelancer_entities.dart';

class FreelancerModel extends FreelancerEntities {
  FreelancerModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.id,
  });

  factory FreelancerModel.fromJson(Map<String, dynamic> json) {
    return FreelancerModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      id: json['_id'] ?? '',
    );
  }
}
