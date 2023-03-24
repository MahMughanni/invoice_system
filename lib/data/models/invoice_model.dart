import 'package:invoice_system/data/models/client_model.dart';
import 'package:invoice_system/data/models/fixed_model.dart';
import 'package:invoice_system/data/models/freelancer_model.dart';
import 'package:invoice_system/domain/entities/invoice_entities.dart';

class InvoiceModel extends InvoiceEntities {
  InvoiceModel({
    required super.client,
    required super.currency,
    required super.fixed,
    required super.freelancer,
    required super.subTotal,
    required super.invoiceNo,
    required super.status,
    required super.id,
    required super.createdAt,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceModel(
      client: ClientModel.fromJson(json['client']),
      currency: json['currency'],
      fixed: List.from(json['fixed']).map((e) => FixedModel.fromJson(e)).toList(),
      freelancer: List.from(json['fixed'])
          .map((e) => FreelancerModel.fromJson(e))
          .toList(),
      subTotal: json['subTotal'] ?? 0,
      invoiceNo: json['invoiceNo'],
      status: json['status'],
      id: json['_id'],
      createdAt: json['createdAt'],
    );
  }
}
