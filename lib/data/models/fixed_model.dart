import 'package:invoice_system/domain/entities/fixed_entities.dart';

class FixedModel extends FixedEntities {
  FixedModel({
    required super.itemName,
    required super.description,
    required super.price,
    super.id,
  });

  factory FixedModel.fromJson(Map<String, dynamic> json) {
    return FixedModel(
        itemName: json['itemName'],
        description: json['description'],
        price: json['price'],
        id: json['_id']);
  }


}
