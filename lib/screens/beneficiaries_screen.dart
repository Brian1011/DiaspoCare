import 'package:flutter/material.dart';

class BeneficiariesScreen extends StatefulWidget {
  @override
  _BeneficiariesScreenState createState() => _BeneficiariesScreenState();
}

class _BeneficiariesScreenState extends State<BeneficiariesScreen> {
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
                      'City',
                      style: TextStyle(color: Colors.white),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      'Approval',
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
                      Expanded(flex: 2, child: Text('First lastname')),
                      Expanded(flex: 2, child: Text('Nairobi')),
                      Expanded(flex: 2, child: Text('Credit')),
                    ],
                  ),
                );
              }),
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
                    flex: 2,
                    child: Text(
                      'Approval',
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
                      Expanded(flex: 2, child: Text('First lastname')),
                      Expanded(flex: 2, child: Text('Nairobi')),
                      Expanded(flex: 2, child: Text('Credit')),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
