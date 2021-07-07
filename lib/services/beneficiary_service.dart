import 'package:diaspo_care/api/api.dart';
import 'package:diaspo_care/data/models/relation_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BeneficiaryService extends ChangeNotifier {
  bool _isLoadingRelation = false;

  bool get isLoadingRelation => _isLoadingRelation;

  set isLoadingRelation(bool value) {
    _isLoadingRelation = value;
    notifyListeners();
  }

  List<BeneficiaryRelation> relations = [];
  Future loadBeneficiaryRelations() {
    isLoadingRelation = true;
    return api.getBeneficiaryRelation().then((response) {
      var payload = response.data;
      _saveRelations(payload['data']);
    }).catchError((error) {
      print('error while loading errors $error');
      Fluttertoast.showToast(
          msg: "Can't load beneficiary relations",
          backgroundColor: Colors.black,
          textColor: Colors.white);
      isLoadingRelation = false;
    });
  }

  void _saveRelations(payload) {
    relations = [];
    payload.forEach((relation) {
      relations.add(BeneficiaryRelation.fromJson(relation));
    });
    isLoadingRelation = false;
  }
}

var beneficiaryService = BeneficiaryService();
