import 'package:diaspo_care/data/models/beneficiary_model.dart';
import 'package:diaspo_care/services/beneficiary_service.dart';
import 'package:diaspo_care/widgets/circular_material_spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupporterHomeScreen extends StatefulWidget {
  @override
  _SupporterHomeScreenState createState() => _SupporterHomeScreenState();
}

class _SupporterHomeScreenState extends State<SupporterHomeScreen> {
  @override
  void initState() {
    super.initState();
    beneficiaryService.loadBeneficiaries();
  }

  int tab = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beneficiaries'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(child: tab == 1 ? BeneficiariesTab() : TransactionsTab()),
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
                      child: Text('Beneficiaries'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tab = 2;
                      });
                    },
                    child: Card(
                      child: Text('Transactions'),
                    ),
                  ),
                ],
              ),
            )
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
                    flex: 2,
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
          child: Consumer<BeneficiaryService>(
            builder: (context, beneficiaryService, _) {
              return CircularMaterialSpinner(
                loading: beneficiaryService.isLoadingBeneficiariesList,
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
                                flex: 2,
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
              itemCount: 10,
              itemBuilder: (context, item) {
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
                      Expanded(flex: 2, child: Text('121234567')),
                      Expanded(flex: 2, child: Text('Jonte Omondi')),
                      Expanded(flex: 2, child: Text('12,000.00')),
                      Expanded(flex: 1, child: Text('New')),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
