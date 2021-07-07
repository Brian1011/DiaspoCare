import 'package:diaspo_care/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePharmacist extends StatefulWidget {
  @override
  _HomePharmacistState createState() => _HomePharmacistState();
}

class _HomePharmacistState extends State<HomePharmacist> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text('Logo place holder'),
                        SizedBox(height: 20),
                        Text('Welcome'),
                        Text('{First Name} {Last Name}'),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.wallet_giftcard_outlined),
                            SizedBox(width: 10),
                            Icon(Icons.notifications)
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: size.width * 0.7,
                    color: Colors.black,
                    height: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      borderedContainer(
                          size: size,
                          label: 'Beneficiaries',
                          iconData: Icons.people_alt_outlined,
                          onTap: () => Navigator.pushNamed(
                              context, RouteConfig.pharmacistBeneficiaries)),
                      borderedContainer(
                          size: size,
                          label: 'Transactions',
                          iconData: Icons.wallet_membership),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      borderedContainer(
                          size: size,
                          label: 'Concierge',
                          iconData: Icons.person_outline),
                      borderedContainer(
                          size: size,
                          label: 'Care Giver',
                          iconData: Icons.clean_hands_outlined),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 1, color: Colors.black12),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                bottomNavItem(label: 'Home', iconData: Icons.home_outlined),
                bottomNavItem(
                    label: 'Transactions',
                    iconData: Icons.wallet_membership_outlined),
                bottomNavItem(
                    label: 'Payment Details',
                    iconData: Icons.credit_card_outlined),
                bottomNavItem(
                    label: 'Account', iconData: Icons.account_circle_outlined),
              ],
            ),
          )
        ],
      )),
    );
  }

  Column bottomNavItem({String label, IconData iconData}) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.blue,
        ),
        Text(label)
      ],
    );
  }

  GestureDetector borderedContainer(
      {String label, IconData iconData, Size size, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.35,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              iconData,
              color: Colors.blueAccent,
            ),
            Text(label)
          ],
        ),
      ),
    );
  }
}
