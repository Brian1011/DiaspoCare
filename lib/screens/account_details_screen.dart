import 'package:diaspo_care/services/auth_service.dart';
import 'package:diaspo_care/widgets/centered_button.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class AccountDetailsScreen extends StatefulWidget {
  @override
  _AccountDetailsScreenState createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  logout() {
    authService.logout();
    Navigator.of(context).pushReplacementNamed(RouteConfig.login);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.black12),
                ),
              ),
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Text('  Profile photo\n Place holder'),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('  First Name   Last Name'),
                      TextButton(
                        onPressed: () => print('go to screen'),
                        child: Text('EDIT PROFILE'),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          '  SIGN OUT',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => print('go to screen'),
              child: Text('Payment History'),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, RouteConfig.paymentMethod),
              child: Text('Payment Methods'),
            ),
            TextButton(
              onPressed: () => print('go to screen'),
              child: Text('Supporter Reports'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => print('go to screen'),
              child: Text('Privacy Policy'),
            ),
            TextButton(
              onPressed: () => print('go to screen'),
              child: Text('Terms and Conditions '),
            ),
            SizedBox(height: 50),
            Center(
              child: CenteredButton(
                  size: size,
                  onPressed: () => print('API guy do something'),
                  child: Text(
                    'Invite User',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
