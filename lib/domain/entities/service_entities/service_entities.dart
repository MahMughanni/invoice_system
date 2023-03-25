// models.dart

class NewServiceEntities {
  final List<FixedItem> fixed;
  final String currency;

  @override
  String toString() {
    return 'NewServiceEntities{fixed: $fixed, currency: $currency}';
  }

  NewServiceEntities({
    required this.fixed,
    required this.currency,
  });

  factory NewServiceEntities.fromJson(Map<String, dynamic> json) {
    final fixed = List<FixedItem>.from(
      json['fixed'].map((itemJson) => FixedItem.fromJson(itemJson)),
    );

    return NewServiceEntities(
      fixed: fixed,
      currency: json['currency'],
    );
  }

  Map<String, dynamic> toJson() => {
        'fixed': fixed.map((item) => item.toJson()).toList(),
        'currency': currency,
      };
}

class FixedItem {
  final String? itemName;
  final String? description;
  final num? price;

  FixedItem({
    this.itemName,
    this.description,
    this.price,
  });

  factory FixedItem.fromJson(Map<String, dynamic> json) {
    return FixedItem(
      itemName: json['itemName'],
      description: json['description'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'itemName': itemName,
        'description': description,
        'price': price,
      };
}
