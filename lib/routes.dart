import 'package:diaspo_care/screens/authentication_screens/login_screen.dart';
import 'package:diaspo_care/screens/authentication_screens/registration_screen.dart';
import 'package:diaspo_care/screens/splash_screen.dart';

class RouteConfig {
  static final splash = "/";
  static final login = "login";
  static final registration = "vendorRegistration";
}

var routes = {
  RouteConfig.splash: (context) => SplashScreen(),
  RouteConfig.login: (context) => LoginScreen(),
  RouteConfig.registration: (context) => RegistrationScreen(),
};
