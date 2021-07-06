import 'package:diaspo_care/screens/account_details_screen.dart';
import 'package:diaspo_care/screens/authentication_screens/login_screen.dart';
import 'package:diaspo_care/screens/authentication_screens/payment_methods_screen.dart';
import 'package:diaspo_care/screens/authentication_screens/registration_screen.dart';
import 'package:diaspo_care/screens/beneficiaries_screen.dart';
import 'package:diaspo_care/screens/splash_screen.dart';

class RouteConfig {
  static final splash = "/";
  static final login = "login";
  static final registration = "vendorRegistration";
  static final paymentRegistration = "paymentRegistration";
  static final beneficiaries = "beneficiaries";
  static final paymentMethod = "paymentMethod";
  static final accountDetails = "accountDetails";
}

var routes = {
  RouteConfig.splash: (context) => SplashScreen(),
  RouteConfig.login: (context) => LoginScreen(),
  RouteConfig.registration: (context) => RegistrationScreen(),
  RouteConfig.paymentRegistration: (context) => PaymentMethodsScreen(),
  RouteConfig.beneficiaries: (context) => BeneficiariesScreen(),
  RouteConfig.paymentMethod: (context) => PaymentMethodsScreen(),
  RouteConfig.accountDetails: (context) => AccountDetailsScreen(),
};
