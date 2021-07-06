import 'package:diaspo_care/screens/authentication_screens/login_screen.dart';
import 'package:diaspo_care/screens/authentication_screens/vendor_registration_screen.dart';
import 'package:diaspo_care/screens/splash_screen.dart';

class RouteConfig {
  static final splash = "/";
  static final login = "login";
  static final vendorRegistration = "vendorRegistration";
}

var routes = {
  RouteConfig.splash: (context) => SplashScreen(),
  RouteConfig.login: (context) => LoginScreen(),
  RouteConfig.vendorRegistration: (context) => VendorRegistrationScreen(),
};
