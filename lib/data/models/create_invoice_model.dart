import 'package:invoice_system/domain/entities/invoice_entities.dart';

class CreateInvoiceModel {
  dynamic id;

  CreateInvoiceModel({required this.id});

  factory CreateInvoiceModel.fromJson(Map<String, dynamic> json) {
    return CreateInvoiceModel(
      id: json["_id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
    };
  }

//
}
