import 'package:diaspo_care/api/api.dart';
import 'package:diaspo_care/data/models/country_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CountryService extends ChangeNotifier {
  bool _isGettingCountries = false;
  bool get isGettingCountries => _isGettingCountries;

  set isGettingCountries(bool val) {
    _isGettingCountries = val;
    notifyListeners();
  }

  List<CountryModel> countries = [];
  Future loadCountries() {
    isGettingCountries = true;
    return api.getCountries().then((response) {
      var payload = response.data;
      _saveCountries(payload['data']);
    }).catchError((error) {
      Fluttertoast.showToast(
          msg: "Can't load countries",
          backgroundColor: Colors.black,
          textColor: Colors.white);
      isGettingCountries = false;
    });
  }

  void _saveCountries(payload) {
    countries = [];
    payload.forEach((country) {
      countries.add(CountryModel.fromMap(country));
    });
    isGettingCountries = false;
  }
}

CountryService countryService = CountryService();
