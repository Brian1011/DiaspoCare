import 'package:diaspo_care/widgets/underlined_textfield.dart';
import 'package:flutter/material.dart';

class PharmacistBeneficiariesScreen extends StatefulWidget {
  @override
  _PharmacistBeneficiariesScreenState createState() =>
      _PharmacistBeneficiariesScreenState();
}

class _PharmacistBeneficiariesScreenState
    extends State<PharmacistBeneficiariesScreen> {
  TextEditingController searchTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Beneficiaries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: UnderlinedTextField(
                controller: searchTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: false,
                onChanged: (value) {
                  print('Searching');
                },
                hintText: 'Search Beneficiaries',
              ),
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Name',
                          style: TextStyle(color: Colors.white),
                        )),
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Unique ID',
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
        ),
      ),
    );
  }
}
