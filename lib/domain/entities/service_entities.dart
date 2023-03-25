class ServiceEntities {
  final String id;
  final List<Fixed> fixed;
  final String currency;
  final int subTotal;
  final String status;
  final int paidInvoice;
  final int revenue;
  final String serviceNo;
  final String createdAt;
  final String updatedAt;

  ServiceEntities({
    required this.id,
    required this.fixed,
    required this.currency,
    required this.subTotal,
    required this.status,
    required this.paidInvoice,
    required this.revenue,
    required this.serviceNo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ServiceEntities.fromJson(Map<String, dynamic> json) {
    return ServiceEntities(
      id: json['_id'],
      fixed: List<Fixed>.from(json['fixed'].map((x) => Fixed.fromJson(x))),
      currency: json['currency'],
      subTotal: json['subTotal'],
      status: json['status'],
      paidInvoice: json['paidInvoice'],
      revenue: json['revenue'],
      serviceNo: json['serviceNo'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  @override
  String toString() {
    return 'ServiceEntities{id: $id, fixed: $fixed, currency: $currency, subTotal: $subTotal, status: $status, paidInvoice: $paidInvoice, revenue: $revenue, serviceNo: $serviceNo, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}

class Fixed {
  final String itemName;
  final String description;
  final int price;
  final String id;

  Fixed({
    required this.itemName,
    required this.description,
    required this.price,
    required this.id,
  });

  factory Fixed.fromJson(Map<String, dynamic> json) {
    return Fixed(
      itemName: json['itemName'],
      description: json['description'],
      price: json['price'],
      id: json['_id'],
    );
  }
}
