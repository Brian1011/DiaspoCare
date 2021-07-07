import 'package:diaspo_care/api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class TransactionService extends ChangeNotifier {
  bool _isGettingSupporterTransactions = false;
  bool get isGettingSupporterTransactions => _isGettingSupporterTransactions;

  set isGettingSupporterTransactions(bool val) {
    _isGettingSupporterTransactions = val;
    notifyListeners();
  }

  Future loadSupporterTransactions() {
    isGettingSupporterTransactions = true;
    return api.getSupporterTransaction().then((response) {
      var payload = response.data;
    });
  }
}

TransactionService transactionService = TransactionService();
