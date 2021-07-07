import 'package:hive/hive.dart';

part '../adapters/registration_step_model.g.dart';

@HiveType(typeId: 1)
class RegistrationStep {
  @HiveField(0)
  String step;

  RegistrationStep({this.step});
}
