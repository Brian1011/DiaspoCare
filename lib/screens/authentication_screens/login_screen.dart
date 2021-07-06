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
    return Column(
      children: [
        Form(
          key: loginFormKey,
          child: Expanded(
            child: ListView(
              children: [
                Text('Welcome to DiaspoCare'),
                SizedBox(height: 20),
                UnderlinedTextField(
                    controller: userNameTextEditingController,
                    hintText: 'Username',
                    onChanged: (value) => print('API guys to do things')),
                SizedBox(height: 20),
                UnderlinedTextField(
                  controller: passwordTextEditingController,
                  hintText: 'Password',
                  onChanged: (value) => print('API guys to do things'),
                  obscureText: true,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
