class FixedEntities {
  FixedEntities({
    required this.itemName,
    required this.description,
    required this.price,
    this.id,
  });

  late final String itemName;
  late final String description;
  late final int price;
  final String? id;

  Map<String, dynamic> toJson() {
    return {
      "itemName": itemName,
      "description": description,
      "price": price,
      "id": id,
    };
  }

  @override
  String toString() {
    return 'FixedEntities{itemName: $itemName, description: $description, price: $price, id: $id}';
  }
}
