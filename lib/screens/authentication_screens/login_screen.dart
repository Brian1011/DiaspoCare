import 'package:diaspo_care/routes.dart';
import 'package:diaspo_care/services/auth_service.dart';
import 'package:diaspo_care/widgets/centered_button.dart';
import 'package:diaspo_care/widgets/underlined_textfield.dart';
import 'package:flutter/material.dart';

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
        print('User Succesfully Logged in');
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
                    CenteredButton(
                      size: size,
                      label: "LOGIN",
                      onPressed: loginSubmitFn,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, RouteConfig.registration),
                      child: Text('Vendor Registration'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, RouteConfig.registration),
                      child: Text('Supporter Registration'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, RouteConfig.beneficiaries),
                      child: Text('Beneficiareis screen'),
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
