import 'package:diaspo_care/data/db.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigate() {
    Navigator.pushReplacementNamed(context, RouteConfig.login);
    // if (authService.isLoggedIn) {
    //   Navigator.pushReplacementNamed(context, RouteConfig.home);
    // } else {
    //   Navigator.pushReplacementNamed(context, RouteConfig.login);
    // }
  }

  void initDatabase() async {
    await db.init();
    navigate();
  }

  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
