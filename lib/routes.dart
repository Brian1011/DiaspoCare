import 'package:diaspo_care/screens/authentication_screens/login_screen.dart';
import 'package:diaspo_care/screens/splash_screen.dart';

class RouteConfig {
  static final splash = "/";
  static final login = "/";
}

var routes = {
  RouteConfig.splash: (context) => SplashScreen(),
  RouteConfig.login: (context) => LoginScreen(),
};
