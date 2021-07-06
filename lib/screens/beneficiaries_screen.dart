import 'package:flutter/material.dart';

class BeneficiariesScreen extends StatefulWidget {
  @override
  _BeneficiariesScreenState createState() => _BeneficiariesScreenState();
}

class _BeneficiariesScreenState extends State<BeneficiariesScreen> {
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
            )
          ],
        ),
      ),
    );
  }
}
