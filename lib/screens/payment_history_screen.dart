import 'package:flutter/material.dart';

class PaymentHistoryScreen extends StatefulWidget {
  @override
  _PaymentHistoryScreenState createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Payment History'),
        ),
        body: Padding(
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
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'Pending',
                                  style: TextStyle(fontSize: 12),
                                )),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
