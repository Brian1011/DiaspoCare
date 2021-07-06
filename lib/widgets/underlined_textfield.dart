import 'package:flutter/material.dart';

class UnderlinedTextField extends StatelessWidget {
  const UnderlinedTextField(
      {@required this.controller,
      this.hintText,
      this.onChanged,
      this.obscureText});

  final TextEditingController controller;
  final String hintText;
  final ValueChanged onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(hintText: hintText),
        onChanged: onChanged);
  }
}
