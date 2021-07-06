import 'package:diaspo_care/widgets/centered_button.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatefulWidget {
  @override
  _PaymentMethodsScreenState createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Methods'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Text(
              'New Payment Method',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            RadioListTile(
              value: 1,
              groupValue: selectedRadioTile,
              title: Text("Credit Card"),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val);
              },
              //activeColor: Colors.blue,
              //secondary: Image.asset('assets/credit_card_logo.png'),
              secondary: Container(
                width: 80,
                height: 80,
                child: Image.asset('assets/credit_card_logo.png'),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              selected: true,
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            RadioListTile(
              value: 2,
              groupValue: selectedRadioTile,
              title: Text("M-Pesa"),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val);
              },
              activeColor: Colors.blue,
              //secondary: Image.asset('assets/mpesa_logo.png'),
              secondary: Container(
                width: 80,
                height: 80,
                child: Image.asset('assets/mpesa_logo.png'),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              selected: true,
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            RadioListTile(
              value: 3,
              groupValue: selectedRadioTile,
              title: Text("PesaLink"),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val);
              },
              activeColor: Colors.blue,
              //secondary: Image.asset('assets/pesaLink_logo.jpg'),
              secondary: Container(
                width: 80,
                height: 80,
                child: Image.asset('assets/pesaLink_logo.jpg'),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              selected: true,
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            RadioListTile(
              value: 4,
              groupValue: selectedRadioTile,
              title: Text("Stripe"),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val);
              },
              activeColor: Colors.blue,
              //secondary: Image.asset('assets/Stripe_logo.png'),
              secondary: Container(
                width: 80,
                height: 80,
                child: Image.asset('assets/Stripe_logo.png'),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              selected: true,
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            RadioListTile(
              value: 5,
              groupValue: selectedRadioTile,
              title: Text("Paypal"),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val);
              },
              activeColor: Colors.blue,
              //secondary: Image.asset('assets/paypal_logo.png'),
              secondary: Container(
                width: 80,
                height: 80,
                child: Image.asset('assets/paypal_logo.png'),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              selected: true,
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(height: 100),
            CenteredButton(
              size: size,
              label: "Save and Proceed",
              onPressed: () => print('API guys to do things'),
            ),
          ],
        ),
      ),
    );
  }
}
