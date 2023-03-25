class TransactionsEntities {


  final int count;
  final List<Transaction> transactions;

  TransactionsEntities({required this.count, required this.transactions});

  factory TransactionsEntities.fromJson(Map<String, dynamic> json) {
    final List<dynamic> transactionsJson = json['transactions'] ?? [];
    final transactions = transactionsJson.map((t) {
      final invoiceJson = t['invoice'];
      final clientJson = invoiceJson['client'];
      final addressJson = clientJson['address'];
      final freelancerJson = invoiceJson['freelancer'];
      final fixedJson = invoiceJson['fixed'] ?? [];

      final fixed = fixedJson.map((f) {
        return Fixed(
          itemName: f['itemName'] ?? '',
          description: f['description'] ?? '',
          price: f['price'] ?? 0,
          id: f['_id'] ?? '',
        );
      }).toList();

      return Transaction(
        id: t['_id'] ?? '',
        invoice: Invoice(
          id: invoiceJson['_id'] ?? '',
          client: Client(
            id: clientJson['_id'] ?? '',
            fullName: clientJson['fullName'] ?? '',
            email: clientJson['email'] ?? '',
            address: Address(
              country: addressJson['country'] ?? '',
            ),
          ),
          currency: invoiceJson['currency'] ?? '',
          fixed: fixed,
          freelancer: Freelancer(
            id: freelancerJson['_id'] ?? '',
            firstName: freelancerJson['firstName'] ?? '',
            lastName: freelancerJson['lastName'] ?? '',
          ),
          subTotal: invoiceJson['subTotal'] ?? 0,
          invoiceNo: invoiceJson['invoiceNo'] ?? '',
          status: invoiceJson['status'] ?? '',
        ),
        type: t['type'] ?? '',
        updatedAt: DateTime.parse(t['updatedAt'] ?? ''),
      );
    }).toList();

    return TransactionsEntities(
      count: json['count'] ?? 0,
      transactions: transactions,
    );
  }

  @override
  String toString() {
    return 'TransactionsEntities{count: $count, transactions: $transactions}';
  }
}

class Transaction {
  String id;
  Invoice invoice;
  String type;
  DateTime updatedAt;

  Transaction(
      {required this.id,
      required this.invoice,
      required this.type,
      required this.updatedAt});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['_id'],
      invoice: Invoice.fromJson(json['invoice']),
      type: json['type'],
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class Invoice {
  String id;
  Client client;
  String currency;
  List<Fixed> fixed;
  Freelancer freelancer;
  int subTotal;
  String invoiceNo;
  String status;

  Invoice({
    required this.id,
    required this.client,
    required this.currency,
    required this.fixed,
    required this.freelancer,
    required this.subTotal,
    required this.invoiceNo,
    required this.status,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['_id'],
      client: Client.fromJson(json['client']),
      currency: json['currency'],
      fixed: List<Fixed>.from(json['fixed'].map((x) => Fixed.fromJson(x))),
      freelancer: Freelancer.fromJson(json['freelancer']),
      subTotal: json['subTotal'],
      invoiceNo: json['invoiceNo'],
      status: json['status'],
    );
  }
}

class Client {
  String id;
  String fullName;
  String email;
  Address address;

  Client(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.address});

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
      address: Address.fromJson(json['address']),
    );
  }
}

class Address {
  String country;

  Address({required this.country});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      country: json['country'],
    );
  }
}

class Fixed {
  String itemName;
  String description;
  int price;
  String id;

  Fixed(
      {required this.itemName,
      required this.description,
      required this.price,
      required this.id});

  factory Fixed.fromJson(Map<String, dynamic> json) {
    return Fixed(
      itemName: json['itemName'],
      description: json['description'],
      price: json['price'],
      id: json['_id'],
    );
  }
}

class Freelancer {
  String id;
  String firstName;
  String lastName;

  Freelancer(
      {required this.id, required this.firstName, required this.lastName});

  factory Freelancer.fromJson(Map<String, dynamic> json) {
    return Freelancer(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
