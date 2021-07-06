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
    //await db.init();
    await Future.delayed(Duration(seconds: 1), navigate);
  }

  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
