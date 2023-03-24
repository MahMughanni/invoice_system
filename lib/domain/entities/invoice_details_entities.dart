import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:invoice_system/domain/entities/address_entities.dart';
import 'package:invoice_system/domain/entities/client_entities.dart';
import 'package:invoice_system/domain/entities/fixed_entities.dart';
import 'package:invoice_system/domain/entities/freelancer_entities.dart';

class InvoiceDetailsEntities extends Equatable {
  final DetailsInvoiceClient? client;
  final String? sId;
  final String? currency;
  final num? ourFee;
  final num? paymentFee;
  final num? revenue;
  final num? balance;
  final List<FixedEntities>? fixed;
  final FreelancerEntities? freelancer;
  final num? subTotal;
  final String? invoiceHashCode;
  final String? invoiceNo;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final List<HistoryEntities>? history;

  const InvoiceDetailsEntities({
    required this.client,
    required this.sId,
    required this.currency,
    required this.ourFee,
    required this.paymentFee,
    required this.revenue,
    required this.balance,
    required this.fixed,
    required this.freelancer,
    required this.subTotal,
    required this.invoiceHashCode,
    required this.invoiceNo,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.history,
  });

  Map<String, dynamic> toJson() {
    return {
      "client": client,
      "sId": sId,
      "currency": currency,
      "ourFee": ourFee,
      "paymentFee": paymentFee,
      "revenue": revenue,
      "balance": balance,
      "fixed": jsonEncode(fixed),
      "freelancer": freelancer,
      "subTotal": subTotal,
      "invoiceHashCode": invoiceHashCode,
      "invoiceNo": invoiceNo,
      "status": status,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "history": jsonEncode(history),
    };
  }

  @override
  List<Object?> get props => [
        client,
        sId,
        currency,
        ourFee,
        paymentFee,
        revenue,
        balance,
        fixed,
        freelancer,
        subTotal,
        invoiceHashCode,
        invoiceNo,
        status,
        createdAt,
        updatedAt,
        history,
      ];

  @override
  String toString() {
    return 'InvoiceDetailsEntities{client: $client, sId: $sId, currency: $currency, ourFee: $ourFee, '
        'paymentFee: $paymentFee, revenue: $revenue, balance: $balance, fixed: $fixed, '
        'freelancer: $freelancer, subTotal: $subTotal, invoiceHashCode: $invoiceHashCode, '
        'invoiceNo: $invoiceNo, status: $status, '
        'createdAt: $createdAt, updatedAt: $updatedAt, history: $history}';
  }
}

class DetailsInvoiceClient {
  final AddressEntities address;
  final String fullName;
  final String sId;
  final String email;

  DetailsInvoiceClient(
      {required this.address,
      required this.fullName,
      required this.sId,
      required this.email});

  factory DetailsInvoiceClient.fromJson(Map<String, dynamic> json) {
    return DetailsInvoiceClient(
      address: AddressEntities.fromJson(json["address"]),
      fullName: json["fullName"],
      sId: json["_id"],
      email: json["email"],
    );
  }

  @override
  String toString() {
    return 'DetailsInvoiceClient{address: $address, fullName: $fullName, sId: $sId, email: $email}';
  }

  Map<String, dynamic> toJson() {
    return {
      "address": address,
      "fullName": fullName,
      "sId": sId,
      "email": email,
    };
  }

//
}

class HistoryEntities {
  final String sId;
  final String type;
  final String action;
  final String status;
  final String createdBy;
  final String createdAt;
  final String updatedAt;

  HistoryEntities({
    required this.sId,
    required this.type,
    required this.action,
    required this.status,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HistoryEntities.fromJson(Map<String, dynamic> json) {
    return HistoryEntities(
      sId: json["_id"],
      type: json["type"],
      action: json["action"],
      status: json["status"],
      createdBy: json["createdBy"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }
}
