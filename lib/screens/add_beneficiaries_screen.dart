import 'package:diaspo_care/services/auth_service.dart';
import 'package:diaspo_care/widgets/centered_button.dart';
import 'package:diaspo_care/widgets/rounded_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    selectedRadioTile = 0;
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
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              ListView(
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
                        child: Container(
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
                          child: DropdownButton<String>(
                            value: selectedCountry,
                            style: TextStyle(color: Colors.white),
                            items: countries
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
                              "Country",
                              style:
                              TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 40),
                      Expanded(
                        child: Container(
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
                          child: DropdownButton<String>(
                            value: selectRelation,
                            style: TextStyle(color: Colors.white),
                            items: relations
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
                              "Country",
                              style:
                              TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                selectRelation = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
