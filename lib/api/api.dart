import 'package:diaspo_care/api/dio.dart';
import 'package:diaspo_care/app_config.dart';

class Api extends DioApi {
  Api() : super(AppConfig.appUrl);

  Future login(String email, String password) {
    return dio.get('/method/hcfa_core.remote_procedures.users.login',
        queryParameters: {'usr': email, 'pwd': password});
  }

  Future signUp(data) {
    return dio.post(
        '/method/hcfa_core.remote_procedures.users.create_diaspocare_account',
        queryParameters: data);
  }

  Future getCountries() {
    return dio.get('/resource/Country');
  }
}

Api api = Api();
