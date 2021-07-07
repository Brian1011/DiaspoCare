import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField(
      {@required this.controller,
      this.hintText,
      this.onChanged,
      this.keyboardType,
      this.obscureText,
      this.validator});

  final TextEditingController controller;
  final String hintText;
  final ValueChanged onChanged;
  final bool obscureText;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        isDense: true,
        labelText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
