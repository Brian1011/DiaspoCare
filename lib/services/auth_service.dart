import 'package:diaspo_care/api/api.dart';
import 'package:diaspo_care/data/db.dart';
import 'package:diaspo_care/data/models/auth_user_model.dart';

import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  bool _isLoggingIn = false;
  bool get isLoggingIn => _isLoggingIn;

  set isLoggingIn(bool val) {
    _isLoggingIn = val;
    notifyListeners();
  }

  Future login(String email, String password) {
    isLoggingIn = true;
    return api.login(email, password).then((response) {
      var payload = response.data;
      _saveLoginData(email, payload);
      return payload;
    }).catchError((error) {
      isLoggingIn = false;
      print('error occured during user login $error');
    });
  }

  _saveLoginData(String email, payload) {
    db.authUserBox.add(AuthUserModel.fromMap(email: email, json: payload));
    isLoggingIn = false;
  }

  bool _isSigningUp = false;
  bool get isSigningUp => _isSigningUp;

  set isSigningUp(bool val) {
    _isSigningUp = val;
    notifyListeners();
  }

  Future signUp(
      {String email,
      String firstName,
      String lastName,
      String middleName,
      DateTime dateOfBirth,
      String gender,
      String country,
      String password,
      String pharmacyName,
      String regPharNumber,
      String city,
      String relation,
      String parentPharmacies,
      String regPharEmail,
      String regPharPhone,
      String pharAddress,
      String fullNames1,
      String fullName2,
      String designation1,
      String designation2,
      String phoneNo1,
      String phoneNo2}) {
    var data = {
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "middle_name": middleName,
      "date_of_birth": dateOfBirth,
      "gender": gender,
      "country": country,
      "new_password": password,
      "phar_name": pharmacyName,
      "phar_reg_no": regPharNumber,
      "city": city,
      "relation": relation,
      "parent_pharmacies": parentPharmacies,
      "phar_email": regPharEmail,
      "phar_reg_phone": regPharPhone,
      "phar_address": pharAddress,
      "full_names1": fullNames1,
      "full_names2": fullName2,
      "designation1": designation1,
      "designation2": designation2,
      "phoneNo1": phoneNo1,
      "phoneNo2": phoneNo2,
    };
    isSigningUp = true;
    return api.signUp(data).then((response) {
      var payload = response.data;
      isSigningUp = false;
      return payload;
    }).catchError((error) {
      print('error occured during user sign up');
      isSigningUp = false;
    });
  }
}

AuthService authService = AuthService();
