import 'package:diaspo_care/data/models/beneficiary_model.dart';
import 'package:diaspo_care/data/models/transaction_model.dart';
import 'package:diaspo_care/services/beneficiary_service.dart';
import 'package:diaspo_care/services/transaction_service.dart';
import 'package:diaspo_care/widgets/circular_material_spinner.dart';
import 'package:diaspo_care/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.pushNamed(context, RouteConfig.addBeneficiary),
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            CustomAppBar(
              goBack: true,
              title: 'Beneficiaries',
              noIcon: false,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
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
                                  bottom: BorderSide(
                                      width: 1, color: Colors.black12),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.account_circle_outlined,
                                    color: Colors.blue,
                                    size: 35,
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${beneficiary?.user?.fullName ?? ''}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                          "${beneficiary?.user?.fullName ?? ''}"),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                      '${beneficiary?.profile?.relation ?? ''}'),
                                ],
                              ),
                            );
                          }),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
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
