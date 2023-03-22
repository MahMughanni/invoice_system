class UserEntities {
  final String accessToken;
  final String refreshToken;
  final UserInfo userInfo;

  UserEntities({
    required this.accessToken,
    required this.refreshToken,
    required this.userInfo,
  });
}

class UserInfo {
  final String id;
  final String firstName;
  final String lastName;
  final String email;

  final double balance;

  UserInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.balance,
  });

  factory UserInfo.fromJson(Map<String, dynamic> jsonMap) {
    return UserInfo(
      id: jsonMap["_id"],
      firstName: jsonMap["firstName"],
      lastName: jsonMap["lastName"],
      email: jsonMap["email"],
      balance: double.parse(jsonMap["balance"].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "balance": balance,
  };
  @override
  String toString() {
    return '$id $firstName $lastName $email  $balance ';
  }
}
