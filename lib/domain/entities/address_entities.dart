class AddressEntities {
  final String country;

  AddressEntities({required this.country});

  factory AddressEntities.fromJson(Map<String, dynamic> json) {
    return AddressEntities(
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "country": country,
    };
  }
}
