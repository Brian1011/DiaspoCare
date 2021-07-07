import 'package:diaspo_care/routes.dart';
import 'package:diaspo_care/services/auth_service.dart';
import 'package:diaspo_care/widgets/centered_button.dart';
import 'package:diaspo_care/widgets/circular_material_spinner.dart';
import 'package:diaspo_care/widgets/underlined_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  void loginSubmitFn() {
    authService
        .login(userNameTextEditingController.text,
            passwordTextEditingController.text)
        .then((value) {
      if (value != null) {
        Navigator.popAndPushNamed(context, RouteConfig.supporterHome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: loginFormKey,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    SizedBox(height: size.height * 0.2),
                    Text(
                      'Welcome to DiaspoCare',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 20),
                    UnderlinedTextField(
                      controller: userNameTextEditingController,
                      hintText: 'Username',
                      onChanged: (value) => print('API guys to do things'),
                      obscureText: false,
                    ),
                    SizedBox(height: 20),
                    UnderlinedTextField(
                      controller: passwordTextEditingController,
                      hintText: 'Password',
                      onChanged: (value) => print('API guys to do things'),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    Selector<AuthService, bool>(
                        selector: (context, authservice) =>
                            authservice.isLoggingIn,
                        builder: (context, isLoggingin, _) {
                          return CenteredButton(
                            size: size,
                            onPressed: loginSubmitFn,
                            child: CircularMaterialSpinner(
                              isBtn: true,
                              loading: isLoggingin,
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          );
                        }),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, RouteConfig.registration),
                      child: Text('Vendor Registration'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, RouteConfig.paymentMethod),
                      child: Text('Payment Method screen'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, RouteConfig.supporterHome),
                      child: Text('Beneficiaries screen'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, RouteConfig.transactionDetail),
                      child: Text('Transaction Details'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, RouteConfig.accountDetails),
                      child: Text('Account Details'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, RouteConfig.paymentHistory),
                      child: Text('Payment History'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, RouteConfig.homePharmacist),
                      child: Text('Home pharmacist'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                'Diaspocare LLC',
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
