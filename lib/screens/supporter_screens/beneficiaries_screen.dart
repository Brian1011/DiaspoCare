import 'package:diaspo_care/data/models/beneficiary_model.dart';
import 'package:diaspo_care/data/models/transaction_model.dart';
import 'package:diaspo_care/services/beneficiary_service.dart';
import 'package:diaspo_care/services/transaction_service.dart';
import 'package:diaspo_care/widgets/circular_material_spinner.dart';
import 'package:diaspo_care/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BeneficiariesScreen extends StatefulWidget {
  @override
  _BeneficiariesScreenState createState() => _BeneficiariesScreenState();
}

class _BeneficiariesScreenState extends State<BeneficiariesScreen> {
  @override
  void initState() {
    super.initState();
    refresh();
  }

  refresh() {
    beneficiaryService.loadBeneficiaries();
    transactionService.loadSupporterTransactions();
  }

  int tab = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              title: tab == 1 ? 'Beneficiaries' : 'Transactions',
              noIcon: true,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                        child:
                            tab == 1 ? BeneficiariesTab() : TransactionsTab()),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(width: 1, color: Colors.black12),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tab = 1;
                              });
                            },
                            child: Card(
                              color: tab == 1
                                  ? Colors.blue.withOpacity(0.9)
                                  : Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Icon(
                                    Icons.people_alt_outlined,
                                    color:
                                        tab == 1 ? Colors.white : Colors.black,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Beneficiaries',
                                      style: TextStyle(
                                        color: tab == 1
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tab = 2;
                              });
                            },
                            child: Card(
                              color: tab == 2
                                  ? Colors.blue.withOpacity(0.9)
                                  : Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Icon(
                                    Icons.credit_card,
                                    color:
                                        tab == 2 ? Colors.white : Colors.black,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Transactions',
                                      style: TextStyle(
                                        color: tab == 2
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BeneficiariesTab extends StatelessWidget {
  const BeneficiariesTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      'Beneficiaries',
                      style: TextStyle(color: Colors.white),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      'Supporter',
                      style: TextStyle(color: Colors.white),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      'Relation',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: Selector<BeneficiaryService, bool>(
            selector: (context, beneficaryService) =>
                beneficaryService.isLoadingBeneficiariesList,
            builder: (context, isLoading, _) {
              return CircularMaterialSpinner(
                loading: beneficiaryService.isLoadingBeneficiariesList,
                isBtn: false,
                color: Colors.blue,
                child: ListView.builder(
                    itemCount: beneficiaryService.beneficiaries.length,
                    itemBuilder: (context, index) {
                      Beneficiary beneficiary =
                          beneficiaryService.beneficiaries[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1, color: Colors.black12),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text(
                                    "${beneficiary?.user?.fullName ?? ''}")),
                            Expanded(
                                flex: 3,
                                child: Text(
                                    '${beneficiary?.profile?.supporter ?? ''}')),
                            Expanded(
                                flex: 2,
                                child: Text(
                                    '${beneficiary?.profile?.relation ?? ''}')),
                          ],
                        ),
                      );
                    }),
              );
            },
          ),
        ),
      ],
    );
  }
}

class TransactionsTab extends StatelessWidget {
  const TransactionsTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<TransactionService, bool>(
        selector: (context, transactionservice) =>
            transactionservice.isGettingSupporterTransactions,
        builder: (context, isGettingTransactions, _) {
          return CircularMaterialSpinner(
            loading: isGettingTransactions,
            color: Theme.of(context).primaryColor,
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
                      itemCount: transactionService.transactions.length,
                      itemBuilder: (context, index) {
                        TransactionModel transaction =
                            transactionService.transactions[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.black12),
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
          );
        });
  }
}
