import 'dart:math';

import 'package:diaspo_care/data/models/transaction_model.dart';
import 'package:diaspo_care/services/transaction_service.dart';
import 'package:diaspo_care/widgets/circular_material_spinner.dart';
import 'package:diaspo_care/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../routes.dart';

class TransactionsScreen extends StatefulWidget {
  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  static final DateFormat formatter = DateFormat('EEE,dd MMM yyyy').add_Hm();

  @override
  void initState() {
    super.initState();
    if (transactionService.transactions.isEmpty)
      transactionService.loadSupporterTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              goBack: true,
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
                            //SizedBox(height: 20),
                            Expanded(
                              child: ListView.builder(
                                  itemCount:
                                      transactionService.transactions.length,
                                  itemBuilder: (context, index) {
                                    TransactionModel transaction =
                                        transactionService.transactions[index];
                                    return Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.black12),
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                              RouteConfig.transactionDetail,
                                              arguments: {
                                                'transaction': transaction
                                              });
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.primaries[
                                                          Random().nextInt(
                                                              Colors.primaries
                                                                  .length)],
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5))),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Center(
                                                      child: Text(
                                                        '${transaction?.transaction?.name[0].toUpperCase()}${transaction?.transaction?.name[1].toUpperCase()}',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                    '${transaction?.transaction?.name}'),
                                                Spacer(),
                                                Text(
                                                    '${formatter.format(transaction?.transaction?.creation)}'),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(children: [
                                                  Text('Beneficiary'),
                                                  SizedBox(width: 30),
                                                  Text(
                                                    '${transaction?.parties?.beneficiary?.user?.fullName}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ]),
                                                Row(children: [
                                                  Text('Amount      '),
                                                  SizedBox(width: 30),
                                                  Text(
                                                    '${transaction?.transaction?.transactionCost}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ]),
                                                Row(children: [
                                                  Text('Pharmacy  '),
                                                  SizedBox(width: 30),
                                                  Text(
                                                    '${transaction?.transaction?.owner}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ]),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pushNamed(
                                                                RouteConfig
                                                                    .transactionDetail,
                                                                arguments: {
                                                              'transaction':
                                                                  transaction
                                                            }),
                                                    child:
                                                        Text('View Details>')),
                                                Spacer(),
                                                Text(
                                                    '${transaction?.transaction?.status}'),
                                              ],
                                            )
                                          ],
                                        ),
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
