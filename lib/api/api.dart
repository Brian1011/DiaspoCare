import 'package:diaspo_care/api/dio.dart';
import 'package:diaspo_care/app_config.dart';

class Api extends DioApi {
  Api() : super(AppConfig.appUrl);

  Future login(String email, String password) {
    return dio.post('/method/hcfa_core.remote_procedures.users.login',
        data: {'usr': email, 'pwd': password});
  }

  Future signUp(data) {
    return dio.post(
        '/method/hcfa_core.remote_procedures.users.create_diaspocare_account',
        data: data);
  }

  Future getCountries() {
    return dio.get('/resource/Country');
  }

  Future getBeneficiaryRelation() {
    return dio.get('/resource/SupporterBeneficiaryRelation');
  }

  Future getBeneficiaryList() {
    return dio.get(
        '/method/hcfa_core.remote_procedures.beneficiaries.get_beneficiaries');
  }

  Future saveBeneficiary({var data}) {
    return dio.post(
        '/method/hcfa_core.remote_procedures.beneficiaries.create_beneficiary',
        data: data);
  }

  Future getSupporterTransaction() {
    return dio.get(
        '/method/hcfa_core.remote_procedures.supporter.get_supporter_transactions');
  }
}

Api api = Api();
