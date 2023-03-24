import 'package:invoice_system/data/models/client_model.dart';
import 'package:invoice_system/data/models/fixed_model.dart';
import 'package:invoice_system/data/models/freelancer_model.dart';
import 'package:invoice_system/domain/entities/fixed_entities.dart';
import 'package:invoice_system/domain/entities/invoice_details_entities.dart';

class InvoiceDetailsModel extends InvoiceDetailsEntities {
  const InvoiceDetailsModel({
    super.client,
    super.sId,
    super.currency,
    super.ourFee,
    super.paymentFee,
    super.revenue,
    super.balance,
    super.fixed,
    super.freelancer,
    super.subTotal,
    super.invoiceHashCode,
    super.invoiceNo,
    super.status,
    super.createdAt,
    super.updatedAt,
    super.history,
  });

  factory InvoiceDetailsModel.newEmpty() {
    return const InvoiceDetailsModel();
  }

  factory InvoiceDetailsModel.fromJson(Map<String, dynamic> json) {
    List fixed = <FixedEntities>[];
    List history = <HistoryEntities>[];

    return InvoiceDetailsModel(
        client: DetailsInvoiceClient.fromJson(json['client']),
        sId: json['_id'],
        currency: json['currency'],
        ourFee: json['ourFee'],
        paymentFee: json['paymentFee'],
        revenue: json['revenue'],
        balance: json['balance'],
        fixed: List.from(json['fixed'])
            .map((e) => FixedModel.fromJson(e))
            .toList(),
        freelancer: FreelancerModel.fromJson(json['freelancer']),
        subTotal: json['subTotal'],
        invoiceHashCode: json['hashCode'],
        invoiceNo: json['invoiceNo'],
        status: json['status'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        history: json['history'] != null
            ? json['history'].forEach((v) {
                history.add(HistoryEntities.fromJson(v));
              })
            : []);
  }
}
