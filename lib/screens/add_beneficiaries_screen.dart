import 'package:diaspo_care/services/auth_service.dart';
import 'package:diaspo_care/services/beneficiary_service.dart';
import 'package:diaspo_care/services/country_service.dart';
import 'package:diaspo_care/widgets/centered_button.dart';
import 'package:diaspo_care/widgets/rounded_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBeneficiariesScreen extends StatefulWidget {
  @override
  _AddBeneficiariesScreenState createState() => _AddBeneficiariesScreenState();
}

class _AddBeneficiariesScreenState extends State<AddBeneficiariesScreen> {
  TextEditingController firstNameTextEditingController;
  TextEditingController lastNameTextEditingController;
  TextEditingController middleTextEditingController;
  TextEditingController relationTextEditingController;

  int radioValue;
  double spacing = 10;

  String selectedCountry, selectRelation;

  List<String> countries = ['Kenya', 'Tanzania', 'Ghana', 'Uganda', 'Nigeria'];
  List<String> relations = ['Child', 'Mother', 'Father'];

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
      firstName: firstNameTextEditingController.text,
      middleName: middleTextEditingController.text,
      lastName: lastNameTextEditingController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Beneficiaries'),
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
                RoundedTextField(
                  controller: firstNameTextEditingController,
                  hintText: 'First Name',
                  onChanged: (value) => print('API guys to do things'),
                  obscureText: false,
                ),
                SizedBox(height: spacing),
                RoundedTextField(
                  controller: middleTextEditingController,
                  hintText: 'Middle Name',
                  onChanged: (value) => print('API guys to do things'),
                  obscureText: false,
                ),
                SizedBox(height: spacing),
                RoundedTextField(
                  controller: lastNameTextEditingController,
                  hintText: 'Last Name',
                  onChanged: (value) => print('API guys to do things'),
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: spacing),
                RoundedTextField(
                  controller: middleTextEditingController,
                  hintText: 'Date of birth',
                  onChanged: (value) => print('API guys to do things'),
                  obscureText: false,
                ),
                SizedBox(height: spacing),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        value: 1,
                        groupValue: selectedRadioTile,
                        title: Text("Male"),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile(val);
                        },
                        activeColor: Colors.blue,
                        selected: true,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        value: 2,
                        groupValue: selectedRadioTile,
                        title: Text("Female"),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile(val);
                        },
                        activeColor: Colors.blue,
                        selected: true,
                      ),
                    ),
                  ],
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
                                    "Relation",
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
                  ],
                ),
                SizedBox(height: spacing * 2),
                CenteredButton(
                  size: size,
                  onPressed: () {},
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
