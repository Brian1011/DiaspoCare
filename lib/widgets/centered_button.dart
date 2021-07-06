import 'package:flutter/material.dart';

class CenteredButton extends StatelessWidget {
  const CenteredButton(
      {@required this.size, @required this.onPressed, @required this.child});

  final Size size;
  final Function onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
        child: MaterialButton(
          color: Theme.of(context).primaryColor,
          height: 40,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: child,
        ));
  }
}
