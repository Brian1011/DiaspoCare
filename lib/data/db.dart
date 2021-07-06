import 'package:diaspo_care/data/models/auth_user_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Database {
  Box<AuthUserModel> authUserBox;

  _initBoxes() async {
    authUserBox = await Hive.openBox('authuserbox');
  }

  _registerAdapters() async {
    Hive.registerAdapter(AuthUserModelAdapter());
  }

  init() async {
    await Hive.initFlutter();
    await _registerAdapters();
    await _initBoxes();
  }
}

Database db = Database();
