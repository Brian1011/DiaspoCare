import 'package:diaspo_care/widgets/underlined_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorRegistrationScreen extends StatefulWidget {
  @override
  _VendorRegistrationScreenState createState() =>
      _VendorRegistrationScreenState();
}

class _VendorRegistrationScreenState extends State<VendorRegistrationScreen> {
  TextEditingController firstNameTextEditingController;
  TextEditingController lastNameTextEditingController;
  TextEditingController emailTextEditingController;
  TextEditingController phoneNumberTextEditingController;

  String selectedCountry, selectedCurrency;

  List<String> countries = ['Kenya', 'Tanzania', 'Ghana', 'Uganda', 'Nigeria'];
  List<String> currencies = ['KSH', 'TSH', 'GHS', 'UGH', 'Naira'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            UnderlinedTextField(
              controller: firstNameTextEditingController,
              hintText: 'First Name',
              onChanged: (value) => print('API guys to do things'),
              obscureText: false,
            ),
            SizedBox(height: 20),
            UnderlinedTextField(
              controller: lastNameTextEditingController,
              hintText: 'Last Name',
              onChanged: (value) => print('API guys to do things'),
              obscureText: false,
            ),
            SizedBox(height: 20),
            UnderlinedTextField(
              controller: emailTextEditingController,
              hintText: 'Email Address',
              onChanged: (value) => print('API guys to do things'),
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    focusColor: Colors.white,
                    value: selectedCountry,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.grey,
                    items:
                        countries.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "Country",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        selectedCountry = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: DropdownButton<String>(
                    focusColor: Colors.white,
                    value: selectedCurrency,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.grey,
                    items: currencies
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "Currency",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        selectedCurrency = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            UnderlinedTextField(
              controller: phoneNumberTextEditingController,
              hintText: 'Phone Number',
              onChanged: (value) => print('API guys to do things'),
              obscureText: false,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
