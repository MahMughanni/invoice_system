class FixedEntities {
  FixedEntities({
    required this.itemName,
    required this.description,
    required this.price,
    required this.id,
  });

  late final String itemName;
  late final String description;
  late final int price;
  late final String id;

  @override
  String toString() {
    return 'FixedEntities{itemName: $itemName, description: $description, price: $price, id: $id}';
  }
}
