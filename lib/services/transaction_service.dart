import 'package:diaspo_care/api/api.dart';
import 'package:diaspo_care/data/models/transaction_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      _saveTransactions(payload['message']);
    }).catchError((error) {
      isGettingSupporterTransactions = false;
      print('error occured while loading transactions $error');
      Fluttertoast.showToast(msg: "Couldn't Load Transactions");
    });
  }

  List<TransactionModel> transactions = [];
  void _saveTransactions(payload) {
    payload.forEach((transaction) {
      transactions.add(TransactionModel.fromMap(transaction));
    });

    isGettingSupporterTransactions = false;
  }
}

TransactionService transactionService = TransactionService();
