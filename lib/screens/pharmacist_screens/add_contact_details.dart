import 'package:diaspo_care/services/auth_service.dart';
import 'package:diaspo_care/services/beneficiary_service.dart';
import 'package:diaspo_care/services/country_service.dart';
import 'package:diaspo_care/widgets/centered_button.dart';
import 'package:diaspo_care/widgets/rounded_textfield.dart';
import 'package:diaspo_care/widgets/underlined_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:diaspo_care/routes.dart';

class AddContactDetails extends StatefulWidget {
  @override
  _AddContactDetailsState createState() => _AddContactDetailsState();
}

class _AddContactDetailsState extends State<AddContactDetails> {
  TextEditingController fullName1TextEditingController = TextEditingController();
  TextEditingController fullName2TextEditingController = TextEditingController();
  TextEditingController designation1TextEditingController = TextEditingController();
  TextEditingController designation2TextEditingController = TextEditingController();
  TextEditingController phoneNo1TextEditingController = TextEditingController();
  TextEditingController phoneNo2TextEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  submitContactDetails() async {
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
        "full_names1": fullName1TextEditingController.text,
        "full_names2": fullName2TextEditingController.text,
        "designation1": designation1TextEditingController.text,
        "designation2": designation2TextEditingController.text,
        "phoneNo1": phoneNo1TextEditingController.text,
        "phoneNo2": phoneNo2TextEditingController.text,
      };

      print(data);

      await beneficiaryService.addNewBeneficiary(data: data).then((value) {
        //Navigator.pushReplacementNamed(context, RouteConfig.beneficiaries);
      }).catchError((error) {
        print(error);
      });
    }
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
                  controller: fullName1TextEditingController,
                  hintText: 'Full Names',
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
                  controller: designation1TextEditingController,
                  hintText: 'Designation',
                  obscureText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Designation is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: spacing),
                UnderlinedTextField(
                  controller: phoneNo1TextEditingController,
                  hintText: 'Phone Number',
                  obscureText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Phone Number is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: spacing),
                Text('Alternative Contact 1', style: TextStyle(fontWeight: FontWeight.bold),),
                UnderlinedTextField(
                  controller: fullName2TextEditingController,
                  hintText: 'Full Names',
                  obscureText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Full Names required";
                    }
                    return null;
                  },
                ),
                UnderlinedTextField(
                  controller: designation2TextEditingController,
                  hintText: 'Designation',
                  obscureText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Designation is required";
                    }
                    return null;
                  },
                ),
                UnderlinedTextField(
                  controller: phoneNo2TextEditingController,
                  hintText: 'Phone Number',
                  obscureText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Phone Number is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: spacing * 4),
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
