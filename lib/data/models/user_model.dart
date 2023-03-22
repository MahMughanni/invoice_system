import 'package:invoice_system/domain/entities/user_entities.dart';

class UserModel extends UserEntities {
  UserModel(
      {required super.accessToken,
      required super.refreshToken,
      required super.userInfo});

  factory UserModel.fromJson(Map<String, dynamic> jsonMap) {
    UserInfo userInfo = UserInfo.fromJson(jsonMap["user"]);
    return UserModel(
      accessToken: jsonMap["accessToken"],
      refreshToken: jsonMap["refreshToken"],
      userInfo: userInfo,
    );
  }

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "user": userInfo.toJson(),
      };
}
