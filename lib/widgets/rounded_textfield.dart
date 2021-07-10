import 'package:flutter/material.dart';

class RoundedTextField extends StatefulWidget {
  RoundedTextField(
      {@required this.controller,
      this.hintText,
      this.onChanged,
      this.keyboardType,
      this.obscureText,
      this.validator,
      @required this.showSuffix});

  final TextEditingController controller;
  final String hintText;
  final ValueChanged onChanged;
  bool obscureText;
  final TextInputType keyboardType;
  bool showSuffix;
  final FormFieldValidator<String> validator;

  @override
  _RoundedTextFieldState createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          isDense: true,
          labelText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: widget.showSuffix
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                  child: Icon(
                    widget.obscureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 20.0,
                    color: Colors.grey,
                  ),
                )
              : Container(
                  width: 1,
                  height: 1,
                )),
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
