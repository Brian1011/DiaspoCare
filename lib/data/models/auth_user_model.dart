import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part '../adapters/auth_user_model.g.dart';

@HiveType(typeId: 0)
class AuthUserModel {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<String> supporters;
  @HiveField(3)
  final List<String> vendors;

  AuthUserModel({this.email, this.name, this.supporters, this.vendors});

  factory AuthUserModel.fromMap({@required email, json}) {
    return AuthUserModel(
      email: email,
      name: json['full_name'],
      supporters:
          json['supporter'].map((supporter) => supporter['name']).toList(),
      vendors: json['vendor'].map((vendor) => vendor['name']).toList(),
    );
  }
}
