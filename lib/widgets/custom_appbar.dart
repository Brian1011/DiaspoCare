import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({@required this.title, this.noIcon, this.goBack = false});
  String title;
  bool goBack;
  bool noIcon = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(width: 1, color: Colors.black38),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            goBack
                ? Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back)),
                      SizedBox(width: 20),
                      Image.asset('assets/DC_logo_small.jpg', height: 30),
                    ],
                  )
                : Image.asset('assets/DC_logo_small.jpg', height: 30),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue),
            ),
            noIcon
                ? Container()
                : Icon(
                    Icons.account_circle_outlined,
                    size: 30,
                    color: Colors.blue,
                  )
          ],
        ));
  }
}
