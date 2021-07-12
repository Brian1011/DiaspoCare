import 'package:diaspo_care/services/auth_service.dart';
import 'package:diaspo_care/widgets/centered_button.dart';
import 'package:diaspo_care/widgets/circular_material_spinner.dart';
import 'package:diaspo_care/widgets/custom_appbar.dart';
import 'package:diaspo_care/widgets/rounded_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();

  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  int radioValue;
  double spacing = 10;

  String selectedCountry, selectedCurrency;

  List<String> countries = ['Kenya', 'Tanzania', 'Ghana', 'Uganda', 'Nigeria'];
  List<String> currencies = ['KSH', 'TSH', 'GHS', 'UGH', 'Naira'];

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

// TODO: new ui has some missing variables;
  registerBtnFn() async {
    if (registrationFormKey.currentState.validate()) {
      await authService
          .signUp(
        country: selectedCountry,
        email: emailTextEditingController.text,
        firstName: firstNameTextEditingController.text,
        lastName: lastNameTextEditingController.text,
        password: passwordTextEditingController.text,
      )
          .then((response) {
        Navigator.pushReplacementNamed(context, RouteConfig.addBeneficiary);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Form(
        key: registrationFormKey,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                CustomAppBar(
                  title: 'Supporter Registration',
                  noIcon: true,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        SizedBox(height: spacing / 2),
                        RoundedTextField(
                          showSuffix: false,
                          controller: firstNameTextEditingController,
                          hintText: 'First Name',
                          onChanged: (value) => print('API guys to do things'),
                          obscureText: false,
                          validator: (value) {
                            if (value.isEmpty) return 'First Name is required';
                            if (value.length < 4)
                              return 'Name must be more than 3 characters';
                            return null;
                          },
                        ),
                        SizedBox(height: spacing),
                        RoundedTextField(
                          showSuffix: false,
                          controller: lastNameTextEditingController,
                          hintText: 'Last Name',
                          onChanged: (value) => print('API guys to do things'),
                          obscureText: false,
                          validator: (value) {
                            if (value.isEmpty) return 'Last name is required';
                            if (value.length < 4)
                              return 'Password must be more than 3 characters';
                            return null;
                          },
                        ),
                        SizedBox(height: spacing),
                        RoundedTextField(
                          showSuffix: false,
                          controller: emailTextEditingController,
                          hintText: 'Email Address',
                          onChanged: (value) => print('API guys to do things'),
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) return 'Email is required';
                            if (value.length < 4)
                              return 'Email must be more than 3 characters';
                            return null;
                          },
                        ),
                        SizedBox(height: spacing),
                        RoundedTextField(
                          showSuffix: true,
                          controller: passwordTextEditingController,
                          hintText: 'Password',
                          onChanged: (value) => print('API guys to do things'),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) return 'Password is required';
                            if (value.length < 4)
                              return 'Password must be more than 3 characters';
                            return null;
                          },
                        ),
                        SizedBox(height: spacing),
                        RoundedTextField(
                          showSuffix: true,
                          controller: confirmPasswordTextEditingController,
                          hintText: 'Confirm Password',
                          onChanged: (value) => print('API guys to do things'),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) return 'Password is required';
                            if (value.length < 4)
                              return 'Password must be more than 3 characters';
                            return null;
                          },
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
                            SizedBox(width: 40),
                            Expanded(
                              child: DropdownButton<String>(
                                focusColor: Colors.white,
                                value: selectedCurrency,
                                style: TextStyle(color: Colors.white),
                                iconEnabledColor: Colors.grey,
                                items: currencies.map<DropdownMenuItem<String>>(
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
                   
                    ],
                  ),),),
                  SizedBox(height: spacing),
                  RoundedTextField(
                    controller: phoneNumberTextEditingController,
                    hintText: 'Phone Number',
                    onChanged: (value) => print('API guys to do things'),
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: spacing),
                  RoundedTextField(
                    controller: addressTextEditingController,
                    hintText: 'Address',
                    onChanged: (value) => print('API guys to do things'),
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: spacing),
                  RoundedTextField(
                    controller: cityTextEditingController,
                    hintText: 'City',
                    onChanged: (value) => print('API guys to do things'),
                    obscureText: false,
                    keyboardType: TextInputType.text,
                        SizedBox(height: spacing),
                        RoundedTextField(
                          showSuffix: false,
                          controller: phoneNumberTextEditingController,
                          hintText: 'Phone Number',
                          onChanged: (value) => print('API guys to do things'),
                          obscureText: false,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: spacing),
                        RoundedTextField(
                          showSuffix: false,
                          controller: phoneNumberTextEditingController,
                          hintText: 'Address',
                          onChanged: (value) => print('API guys to do things'),
                          obscureText: false,
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: spacing),
                        RoundedTextField(
                          showSuffix: false,
                          controller: phoneNumberTextEditingController,
                          hintText: 'City',
                          onChanged: (value) => print('API guys to do things'),
                          obscureText: false,
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: spacing),
                        Selector<AuthService, bool>(
                            selector: (context, authservice) =>
                                authservice.isSigningUp,
                            builder: (context, isSiginingUp, _) {
                              return CenteredButton(
                                size: size,
                                onPressed: registerBtnFn,
                                child: CircularMaterialSpinner(
                                  isBtn: true,
                                  loading: isSiginingUp,
                                  child: Text(
                                    'REGISTER',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
