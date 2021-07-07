import 'package:diaspo_care/screens/account_details_screen.dart';
import 'package:diaspo_care/screens/add_beneficiaries_screen.dart';
import 'package:diaspo_care/screens/authentication_screens/login_screen.dart';
import 'package:diaspo_care/screens/authentication_screens/payment_methods_screen.dart';
import 'package:diaspo_care/screens/authentication_screens/registration_screen.dart';
import 'package:diaspo_care/screens/beneficiaries_screen.dart';
import 'package:diaspo_care/screens/payment_history_screen.dart';
import 'package:diaspo_care/screens/pharmacist_screens/home_pharmacist.dart';
import 'package:diaspo_care/screens/pharmacist_screens/add_phar_bank_details.dart';
import 'package:diaspo_care/screens/pharmacist_screens/pharmarcy_registration_screen.dart';
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
  static final addPayment = "addPayment";
  static final addBeneficiary = "addBeneficiary";
  static final homePharmacist = "homePharmacist";
  static final registerPharmacy ="registerPharmacy";
  static final addPharBankDetails ="pharmacyBankDetails";
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
  RouteConfig.addPayment: (context) => PaymentMethodsScreen(),
  RouteConfig.addBeneficiary: (context) => AddBeneficiariesScreen(),
  RouteConfig.homePharmacist: (context) => HomePharmacist(),
  RouteConfig.registerPharmacy: (context) => PharmacyRegistrationScreen(),
  RouteConfig.addPharBankDetails: (context) => AddPharBankDetails(),
};
