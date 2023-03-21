import 'package:invoice_system/domain/entities/client_entities.dart';
import 'package:invoice_system/domain/entities/fixed_entities.dart';
import 'package:invoice_system/domain/entities/freelancer_entities.dart';

class InvoiceEntities {
  late final String id;
  late final ClientEntities client;
  late final String currency;
  late final List<FixedEntities> fixed;
  late final List<FreelancerEntities> freelancer;
  late final int subTotal;
  late final String invoiceNo;
  late final String status;

  InvoiceEntities({
    required this.id,
    required this.client,
    required this.currency,
    required this.fixed,
    required this.freelancer,
    required this.subTotal,
    required this.invoiceNo,
    required this.status,
  });
}
