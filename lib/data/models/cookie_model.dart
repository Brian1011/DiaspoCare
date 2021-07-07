import 'package:hive/hive.dart';

part '../adapters/cookie_model.g.dart';

@HiveType(typeId: 2)
class CookieModel {
  @HiveField(0)
  String cookie;

  CookieModel({this.cookie});
}
