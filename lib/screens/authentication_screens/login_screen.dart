import 'package:diaspo_care/routes.dart';
import 'package:diaspo_care/widgets/centered_button.dart';
import 'package:diaspo_care/widgets/underlined_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController;
  TextEditingController passwordTextEditingController;

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
                      onPressed: () => print('API guys to do things'),
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
