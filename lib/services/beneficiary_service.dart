import 'package:diaspo_care/api/api.dart';
import 'package:diaspo_care/data/models/relation_model.dart';
import 'package:flutter/cupertino.dart';

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
      print('error occured while loading errors $error');
      isLoadingRelation = true;
    });
  }

  void _saveRelations(payload) {
    relations = [];
    payload.forEach((relation) {
      relations.add(BeneficiaryRelation.fromJson(relation));
    });
  }
}

var beneficiaryService = BeneficiaryService();
