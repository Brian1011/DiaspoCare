import 'package:diaspo_care/screens/account_details_screen.dart';
import 'package:diaspo_care/screens/authentication_screens/login_screen.dart';
import 'package:diaspo_care/screens/authentication_screens/payment_methods_screen.dart';
import 'package:diaspo_care/screens/authentication_screens/registration_screen.dart';
import 'package:diaspo_care/screens/beneficiaries_screen.dart';
import 'package:diaspo_care/screens/payment_history_screen.dart';
import 'package:diaspo_care/screens/splash_screen.dart';
import 'package:diaspo_care/screens/transaction_details_screen.dart';

class RouteConfig {
  static final login = "login";
  static final splash = "splash";
  static final registration = "vendorRegistration";
  static final paymentRegistration = "paymentRegistration";
  static final beneficiaries = "beneficiaries";
  static final paymentMethod = "paymentMethod";
  static final accountDetails = "accountDetails";
  static final paymentHistory = "paymentHistory";
  static final transactionDetail = "transactionDetail";
}

var routes = {
  RouteConfig.splash: (context) => SplashScreen(),
  RouteConfig.login: (context) => LoginScreen(),
  RouteConfig.registration: (context) => RegistrationScreen(),
  RouteConfig.paymentRegistration: (context) => PaymentMethodsScreen(),
  RouteConfig.beneficiaries: (context) => BeneficiariesScreen(),
  RouteConfig.paymentMethod: (context) => PaymentMethodsScreen(),
  RouteConfig.accountDetails: (context) => AccountDetailsScreen(),
  RouteConfig.paymentHistory: (context) => PaymentHistoryScreen(),
  RouteConfig.transactionDetail: (context) => TransactionDetailScreen(),
};
