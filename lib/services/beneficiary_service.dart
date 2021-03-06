import 'package:diaspo_care/api/api.dart';
import 'package:diaspo_care/data/models/beneficiary_model.dart';
import 'package:diaspo_care/data/models/relation_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BeneficiaryService extends ChangeNotifier {
  bool _isLoadingRelation = false;
  bool _isLoadingBeneficiariesList = false;
  bool _isLoadingBeneficiaryAdd = false;

  bool get isLoadingBeneficiaryAdd => _isLoadingBeneficiaryAdd;

  set isLoadingBeneficiaryAdd(bool value) {
    _isLoadingBeneficiaryAdd = value;
    notifyListeners();
  }

  bool get isLoadingRelation => _isLoadingRelation;

  set isLoadingRelation(bool value) {
    _isLoadingRelation = value;
    notifyListeners();
  }

  bool get isLoadingBeneficiariesList => _isLoadingBeneficiariesList;

  set isLoadingBeneficiariesList(bool value) {
    _isLoadingBeneficiariesList = value;
    notifyListeners();
  }

  List<BeneficiaryRelation> relations = [];
  List<Beneficiary> beneficiaries = [];

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

  Future loadBeneficiaries() async {
    isLoadingBeneficiariesList = true;
    return await api.getBeneficiaryList().then((response) {
      var payload = response.data["message"];
      _saveBeneficiaries(payload);
    }).catchError((error) {
      isLoadingBeneficiariesList = false;
      print('error while loading errors $error');
      Fluttertoast.showToast(
          msg: "Can't load beneficiaries list",
          backgroundColor: Colors.black,
          textColor: Colors.white);
      return throw error;
    });
  }

  _saveBeneficiaries(payload) {
    beneficiaries = [];
    payload.forEach((beneficiary) {
      beneficiaries.add(Beneficiary.fromJson(beneficiary));
    });
    isLoadingBeneficiariesList = false;
  }

  Future addNewBeneficiary({var data}) async {
    isLoadingBeneficiaryAdd = true;
    return await api.saveBeneficiary(data: data).then((response) {
      Fluttertoast.showToast(
          msg: "Beneficiary added successfully",
          backgroundColor: Colors.black,
          textColor: Colors.white);
      isLoadingBeneficiaryAdd = false;
      return response;
    }).catchError((error) {
      isLoadingBeneficiaryAdd = false;
      Fluttertoast.showToast(
          msg: "Can't save beneficiary",
          backgroundColor: Colors.black,
          textColor: Colors.white);
      return throw error;
    });
  }
}

BeneficiaryService beneficiaryService = BeneficiaryService();
