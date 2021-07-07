import 'package:diaspo_care/services/auth_service.dart';
import 'package:diaspo_care/services/beneficiary_service.dart';
import 'package:diaspo_care/services/country_service.dart';
import 'package:diaspo_care/widgets/centered_button.dart';
import 'package:diaspo_care/widgets/rounded_textfield.dart';
import 'package:diaspo_care/widgets/underlined_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddContactDetails extends StatefulWidget {
  @override
  _AddContactDetailsState createState() => _AddContactDetailsState();
}

class _AddContactDetailsState extends State<AddContactDetails> {
  TextEditingController fullName1TextEditingController;
  TextEditingController fullName2TextEditingController;
  TextEditingController designation1TextEditingController;
  TextEditingController designation2TextEditingController;
  TextEditingController phoneNo1TextEditingController;
  TextEditingController phoneNo2TextEditingController;

  int radioValue;
  double spacing = 10;

  void radioButtonHandler(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          radioValue = 0;
          break;
        case 1:
          radioValue = 1;
          break;
      }
    });
  }

  int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    refresh();
    selectedRadioTile = 0;
  }

  refresh() {
    countryService.loadCountries();
    beneficiaryService.loadBeneficiaryRelations();
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

// TODO: new ui has some missing variables;
  void registerBtnFn() {
    authService.signUp(
      fullNames1: fullName1TextEditingController.text,
      fullName2: fullName2TextEditingController.text,
      designation1: designation1TextEditingController.text,
      designation2: designation2TextEditingController.text,
      phoneNo1: phoneNo1TextEditingController.text,
      phoneNo2: phoneNo2TextEditingController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacy Registration'),
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: refresh),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            child: ListView(
              children: [
                SizedBox(height: spacing / 2),
                Text('Alternative Contact 1', style: TextStyle(fontWeight: FontWeight.bold),),
                UnderlinedTextField(
                  controller: middleTextEditingController,
                  hintText: 'Date of birth',
                  obscureText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Date of birth is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: spacing),
                UnderlinedTextField(
                  controller: pharmacyRegNumberTextEditingController,
                  hintText: 'Pharmacy Registration No.',
                  onChanged: (value) => print('API guys to do things'),
                  obscureText: false,
                ),
                SizedBox(height: spacing),
                UnderlinedTextField(
                  controller: pharmacyRegEmailTextEditingController,
                  hintText: 'Registered Pharmacy Email Address',
                  onChanged: (value) => print('API guys to do things'),
                  obscureText: false,
                ),
                SizedBox(height: spacing),
                UnderlinedTextField(
                  controller: pharmacyRegEmailTextEditingController,
                  hintText: 'Registered Pharmacy Phone Number',
                  onChanged: (value) => print('API guys to do things'),
                  obscureText: false,
                ),
                UnderlinedTextField(
                  controller: pharmacyAddressTextEditingController,
                  hintText: 'Address',
                  onChanged: (value) => print('API guys to do things'),
                  obscureText: false,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Attach Practice License'),
                ),
                SizedBox(height: spacing * 2),
                CenteredButton(
                  size: size,
                  onPressed: () {},
                  child: Text(
                    'Save and Proceed',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
