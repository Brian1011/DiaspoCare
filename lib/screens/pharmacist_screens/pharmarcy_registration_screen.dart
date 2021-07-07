import 'package:diaspo_care/services/auth_service.dart';
import 'package:diaspo_care/services/beneficiary_service.dart';
import 'package:diaspo_care/services/country_service.dart';
import 'package:diaspo_care/widgets/centered_button.dart';
import 'package:diaspo_care/widgets/rounded_textfield.dart';
import 'package:diaspo_care/widgets/underlined_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PharmacyRegistrationScreen extends StatefulWidget {
  @override
  _PharmacyRegistrationScreenState createState() =>
      _PharmacyRegistrationScreenState();
}

class _PharmacyRegistrationScreenState
    extends State<PharmacyRegistrationScreen> {
  TextEditingController pharmacyNameTextEditingController;
  TextEditingController pharmacyRegNumberTextEditingController;
  TextEditingController pharmacyRegEmailTextEditingController;
  TextEditingController pharmacyRegPhoneTextEditingController;
  TextEditingController pharmacyAddressTextEditingController;

  int radioValue;
  double spacing = 10;

  String selectedCountry, selectedCity, selectedPharmacy;

  List<String> countries = ['Kenya', 'Tanzania', 'Ghana', 'Uganda', 'Nigeria'];
  List<String> city = ['Nairobi', 'Dodoma', 'Accra', 'Kampala', 'Lagos'];
  List<String> parentPharmacies = ['Pharmacy 1', 'Pharmacy 2', 'Pharmacy 3'];

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
      country: selectedCountry,
      city: selectedCity,
      parentPharmacies: selectedPharmacy,
      pharmacyName: pharmacyNameTextEditingController.text,
      regPharNumber: pharmacyRegNumberTextEditingController.text,
      regPharEmail: pharmacyRegEmailTextEditingController.text,
      regPharPhone: pharmacyRegPhoneTextEditingController.text,
      pharAddress: pharmacyAddressTextEditingController.text,
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
                Row(
                  children: [
                    Text('Is a branch'),
                    Checkbox(
                      value: false,
                      onChanged: (val) {},
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: DropdownButton<String>(
                    value: selectedPharmacy,
                    style: TextStyle(color: Colors.white),
                    items: parentPharmacies
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
                      "Parent Pharmacy",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        selectedPharmacy = value;
                      });
                    },
                  ),
                ),
                UnderlinedTextField(
                  controller: pharmacyNameTextEditingController,
                  hintText: 'Pharmacy Name',
                  onChanged: (value) => print('API guys to do things'),
                  obscureText: false,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: Selector<CountryService, bool>(
                      selector: (context, countryService) =>
                          countryService.isGettingCountries,
                      builder: (context, _loading, _) {
                        return Column(
                          children: [
                            Container(
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                              ),
                              width: double.infinity,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: DropdownButton<String>(
                                  value: selectedCountry,
                                  style: TextStyle(color: Colors.white),
                                  items: countries
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
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
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  onChanged: (String value) {
                                    setState(() {
                                      selectedCountry = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            if (_loading) LinearProgressIndicator()
                          ],
                        );
                      },
                    )),
                    SizedBox(width: 40),
                    Expanded(
                      child: Selector<BeneficiaryService, bool>(
                        selector: (context, beneficiaryService) =>
                            beneficiaryService.isLoadingRelation,
                        builder: (context, _loading, _) {
                          return Column(
                            children: [
                              Container(
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                        color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                                width: double.infinity,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: DropdownButton<String>(
                                    value: selectedCity,
                                    style: TextStyle(color: Colors.white),
                                    items: city.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                    hint: Text(
                                      "City",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                    onChanged: (String value) {
                                      setState(() {
                                        selectedCity = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              if (_loading) LinearProgressIndicator()
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
