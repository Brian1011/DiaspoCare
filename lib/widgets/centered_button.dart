import 'package:flutter/material.dart';

class CenteredButton extends StatelessWidget {
  const CenteredButton(
      {@required this.size, @required this.onPressed, @required this.label});

  final Size size;
  final Function onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
      child: MaterialButton(
        color: Theme.of(context).primaryColor,
        height: 40,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Text(
          label,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
    );
  }
}
