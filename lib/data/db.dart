import 'package:diaspo_care/data/models/auth_user_model.dart';
import 'package:diaspo_care/data/models/registration_step_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Database {
  Box<AuthUserModel> authUserBox;
  Box<RegistrationStep> registrationStepBox;

  _initBoxes() async {
    authUserBox = await Hive.openBox('authuserbox');
    registrationStepBox =
        await Hive.openBox('registrationSteps'); // signup, payment, beneficiary
  }

  _registerAdapters() async {
    Hive.registerAdapter(AuthUserModelAdapter());
    Hive.registerAdapter(RegistrationStepAdapter());
  }

  init() async {
    await Hive.initFlutter();
    await _registerAdapters();
    await _initBoxes();
  }
}

Database db = Database();
