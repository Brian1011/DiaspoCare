import 'package:flutter/material.dart';

class UnderlinedTextField extends StatelessWidget {
  const UnderlinedTextField(
      {@required this.controller,
      this.hintText,
      this.onChanged,
      this.keyboardType,
      this.obscureText});

  final TextEditingController controller;
  final String hintText;
  final ValueChanged onChanged;
  final bool obscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(hintText: hintText),
        keyboardType: keyboardType,
        onChanged: onChanged);
  }
}
