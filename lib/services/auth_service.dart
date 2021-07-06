import 'package:diaspo_care/api/api.dart';

import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  Future login(String email, String password) {
    return api.login(email, password).then((response) {
      var payload = response.data;
      return payload;
    }).catchError((error) {
      print('error occured during user login $error');
    });
  }

  Future signUp(
      String email,
      String firstName,
      String lastName,
      String middleName,
      DateTime dateOfBirth,
      String gender,
      String country,
      String password) {
    var data = {
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "middle_name": middleName,
      "date_of_birth": dateOfBirth,
      "gender": gender,
      "country": country,
      "new_password": password,
    };

    return api.signUp(data).then((response) {
      var payload = response.data;
      return payload;
    }).catchError((error) {
      print('error occured during user sign up');
    });
  }
}

AuthService authService = AuthService();
