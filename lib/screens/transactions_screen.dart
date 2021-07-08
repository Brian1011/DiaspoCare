import 'package:diaspo_care/data/models/transaction_model.dart';
import 'package:diaspo_care/services/transaction_service.dart';
import 'package:diaspo_care/widgets/circular_material_spinner.dart';
import 'package:diaspo_care/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsScreen extends StatefulWidget {
  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Transactions',
              noIcon: true,
            ),
            Expanded(
              child: Selector<TransactionService, bool>(
                  selector: (context, transactionservice) =>
                      transactionservice.isGettingSupporterTransactions,
                  builder: (context, isGettingTransactions, _) {
                    return CircularMaterialSpinner(
                      loading: isGettingTransactions,
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Trans ID',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Beneficiaries',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Amount',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Status',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Expanded(
                              child: ListView.builder(
                                  itemCount:
                                      transactionService.transactions.length,
                                  itemBuilder: (context, index) {
                                    TransactionModel transaction =
                                        transactionService.transactions[index];
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.black12),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                  '${transaction?.transaction?.basket}')),
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                  '${transaction?.parties?.beneficiary?.user?.fullName}')),
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                  '${transaction?.transaction?.transactionCost}')),
                                          Expanded(
                                              flex: 1,
                                              child: FittedBox(
                                                child: Text(
                                                    '${transaction?.transaction?.status}'),
                                              )),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
