import 'package:diaspo_care/services/auth_service.dart';
import 'package:diaspo_care/services/beneficiary_service.dart';
import 'package:diaspo_care/services/country_service.dart';
import 'package:diaspo_care/widgets/centered_button.dart';
import 'package:diaspo_care/widgets/circular_material_spinner.dart';
import 'package:diaspo_care/widgets/rounded_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../routes.dart';

class AddBeneficiariesScreen extends StatefulWidget {
  @override
  _AddBeneficiariesScreenState createState() => _AddBeneficiariesScreenState();
}

class _AddBeneficiariesScreenState extends State<AddBeneficiariesScreen> {
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController middleTextEditingController = TextEditingController();
  TextEditingController relationTextEditingController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  DateTime pickedDate;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int radioValue;
  double spacing = 10;

  String selectedCountry, selectedRelation;

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
    selectedRadioTile = 1;
  }

  refresh() {
    countryService.loadCountries();
    beneficiaryService.loadBeneficiaryRelations();
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
      if (val == 1) {
        genderController?.text = "male";
      } else {
        genderController?.text = "female";
      }
    });
  }

  pickDateOfBirth() async {
    pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 36500)),
      lastDate: DateTime.now().subtract(Duration(hours: 1)),
    );
    if (pickedDate != null) {
      // appointmentDateCtrl.text = "${formatDate(pickedDate, "MMM d, yyyy")}";
      setState(() {
        DateFormat format = DateFormat('yyyy-MM-dd');
        var data = format.format(pickedDate);
        dateOfBirthController.text = data.toString();
      });
    }
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

  submitBeneficiary() async {
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
        "first_name": firstNameTextEditingController.text,
        "last_name": lastNameTextEditingController.text,
        "middle_name": middleTextEditingController.text,
        "date_of_birth": dateOfBirthController.text,
        "gender": genderController.text,
        "country": countryController.text,
        "relation": selectedRelation
      };

      print(data);

      await beneficiaryService.addNewBeneficiary(data: data).then((value) {
        print('******************VALUE');
        print(value);
        Navigator.pushReplacementNamed(context, RouteConfig.beneficiaries);
      }).catchError((error) {
        print('******************ERROR');
        print(error);
      });
    }
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
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: spacing / 2),
                RoundedTextField(
                  controller: firstNameTextEditingController,
                  hintText: 'First Name',
                  obscureText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "First name is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: spacing),
                RoundedTextField(
                  controller: middleTextEditingController,
                  hintText: 'Middle Name',
                  obscureText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Middle name is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: spacing),
                RoundedTextField(
                  controller: lastNameTextEditingController,
                  hintText: 'Last Name',
                  obscureText: false,
                  //keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Last name is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: spacing),
                GestureDetector(
                  onTap: pickDateOfBirth,
                  child: AbsorbPointer(
                    child: RoundedTextField(
                      controller: dateOfBirthController,
                      hintText: 'Date of birth',
                      obscureText: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Date of birth is required";
                        }
                        return null;
                      },
                    ),
                  ),
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
                    Expanded(child: Consumer<CountryService>(
                      builder: (context, countryService, _) {
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
                                  items: countryService.countries
                                      .map<DropdownMenuItem<String>>((country) {
                                    return DropdownMenuItem<String>(
                                      value: country?.name ?? '',
                                      child: Text(
                                        country?.name ?? '',
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
                            if (countryService.isGettingCountries)
                              LinearProgressIndicator()
                          ],
                        );
                      },
                    )),
                    SizedBox(width: 40),
                    Expanded(child: Consumer<BeneficiaryService>(
                      builder: (context, beneficiaryService, _) {
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
                                  value: selectedRelation,
                                  style: TextStyle(color: Colors.white),
                                  items: beneficiaryService.relations
                                      .map<DropdownMenuItem<String>>(
                                          (relation) {
                                    return DropdownMenuItem<String>(
                                      value: relation?.name ?? '',
                                      child: Text(
                                        relation?.name ?? '',
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
                                      selectedRelation = value;
                                      relationTextEditingController.text =
                                          value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            if (countryService.isGettingCountries)
                              LinearProgressIndicator()
                          ],
                        );
                      },
                    )),
                  ],
                ),
                SizedBox(height: spacing * 2),
                Selector<BeneficiaryService, bool>(
                  selector: (context, beneficiaryService) =>
                      beneficiaryService.isLoadingBeneficiaryAdd,
                  builder: (context, isLoadingBeneficiaryAdd, _) {
                    return CenteredButton(
                      size: size,
                      onPressed: submitBeneficiary,
                      child: CircularMaterialSpinner(
                        isBtn: true,
                        color: Colors.white,
                        loading: isLoadingBeneficiaryAdd,
                        child: Text(
                          'Save',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
