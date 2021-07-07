import 'package:diaspo_care/services/auth_service.dart';
import 'package:diaspo_care/services/beneficiary_service.dart';
import 'package:diaspo_care/services/country_service.dart';
import 'package:diaspo_care/widgets/centered_button.dart';
import 'package:diaspo_care/widgets/rounded_textfield.dart';
import 'package:diaspo_care/widgets/underlined_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:diaspo_care/routes.dart';

class PharmacyRegistrationScreen extends StatefulWidget {
  @override
  _PharmacyRegistrationScreenState createState() =>
      _PharmacyRegistrationScreenState();
}

class _PharmacyRegistrationScreenState
    extends State<PharmacyRegistrationScreen> {
  TextEditingController pharmacyNameTextEditingController =
      TextEditingController();
  TextEditingController pharmacyRegNumberTextEditingController =
      TextEditingController();
  TextEditingController pharmacyRegEmailTextEditingController =
      TextEditingController();
  TextEditingController pharmacyRegPhoneTextEditingController =
      TextEditingController();
  TextEditingController pharmacyAddressTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  bool validateForm() {
    if (formKey.currentState.validate()) {
      return true;
    } else {
      Fluttertoast.showToast(
          msg: "Check your form input for errors",
          backgroundColor: Colors.black,
          textColor: Colors.white);
      return false;
    }
  }

  submitPharmacyDetails() async {
    if (validateForm()) {
      /*var data = {
        "first_name": "johm",
        "last_name": "linda",
        "middle_name": "tess",
        "date_of_birth": "1998-07-23",
        "gender": "male",
        "country": "KEN",
        "relation": "child"
      };*/

      var data = {
        "phar_name": pharmacyNameTextEditingController.text,
        "phar_reg_no": pharmacyRegNumberTextEditingController.text,
        "phar_email": pharmacyRegEmailTextEditingController.text,
        "phar_reg_phone": pharmacyRegPhoneTextEditingController.text,
        "phar_address": pharmacyAddressTextEditingController.text,
      };

      print(data);

      await beneficiaryService.addNewBeneficiary(data: data).then((value) {
        //Navigator.pushReplacementNamed(context, RouteConfig.beneficiaries);
      }).catchError((error) {
        print(error);
      });
    }
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
                  obscureText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Full Names required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: spacing),
                UnderlinedTextField(
                  controller: pharmacyRegNumberTextEditingController,
                  hintText: 'Pharmacy Registration No.',
                  obscureText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Full Names required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: spacing),
                UnderlinedTextField(
                  controller: pharmacyRegEmailTextEditingController,
                  hintText: 'Registered Pharmacy Email Address',
                  obscureText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Full Names required";
                    }
                    return null;
                  },
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
                  obscureText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Full Names required";
                    }
                    return null;
                  },
                ),
                UnderlinedTextField(
                  controller: pharmacyAddressTextEditingController,
                  hintText: 'Address',
                  obscureText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Full Names required";
                    }
                    return null;
                  },
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
