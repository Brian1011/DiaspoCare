import 'package:diaspo_care/widgets/centered_button.dart';
import 'package:diaspo_care/widgets/custom_appbar.dart';
import 'package:diaspo_care/widgets/underlined_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';

import '../../routes.dart';

class AddPharBankDetails extends StatefulWidget {
  @override
  _AddPharBankDetailsState createState() => _AddPharBankDetailsState();
}

class _AddPharBankDetailsState extends State<AddPharBankDetails> {
  int selectedRadioTile = 0;
  double spacing = 10;
  String cardNumber, expiryDate, cardHolderName, cvvCode;
  final GlobalKey<FormState> cardFormKey = GlobalKey<FormState>();
  TextEditingController mpesaNameTextEditingController =
      TextEditingController();
  TextEditingController mpesaNumberTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  openBeneficiary() {
    Navigator.pushReplacementNamed(context, RouteConfig.addBeneficiary);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Bank Details',
              noIcon: true,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'New Payment Method',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: 20),
                    RadioListTile(
                      value: 1,
                      groupValue: selectedRadioTile,
                      title: Text("Credit Card"),
                      onChanged: (val) {
                        print("Radio Tile pressed $val");
                        setSelectedRadioTile(val);
                      },
                      //activeColor: Colors.blue,
                      //secondary: Image.asset('assets/credit_card_logo.png'),
                      secondary: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset('assets/credit_card_logo.png'),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      selected: true,
                    ),
                    selectedRadioTile == 1
                        ? Card(
                            child: Column(
                              children: [
                                CreditCardForm(
                                  formKey: cardFormKey, // Required
                                  onCreditCardModelChange:
                                      (CreditCardModel data) {}, // Required
                                  themeColor: Colors.red,
                                  obscureCvv: true,
                                  obscureNumber: true,
                                  cardNumberDecoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Number',
                                    hintText: 'XXXX XXXX XXXX XXXX',
                                  ),
                                  expiryDateDecoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Expired Date',
                                    hintText: 'XX/XX',
                                  ),
                                  cvvCodeDecoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'CVV',
                                    hintText: 'XXX',
                                  ),
                                  cardHolderDecoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Card Holder',
                                  ),
                                  cardNumber: cardNumber, cvvCode: cvvCode,
                                  cardHolderName: cardHolderName,
                                  expiryDate: expiryDate,
                                ),
                                SizedBox(height: spacing),
                                CenteredButton(
                                  size: size,
                                  onPressed: openBeneficiary,
                                  child: Text(
                                    'Save Card',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: spacing),
                              ],
                            ),
                          )
                        : Container(),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    RadioListTile(
                      value: 2,
                      groupValue: selectedRadioTile,
                      title: Text("M-Pesa"),
                      onChanged: (val) {
                        print("Radio Tile pressed $val");
                        setSelectedRadioTile(val);
                      },
                      activeColor: Colors.blue,
                      //secondary: Image.asset('assets/mpesa_logo.png'),
                      secondary: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset('assets/mpesa_logo.png'),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      selected: true,
                    ),
                    selectedRadioTile == 2
                        ? Card(
                            child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment Information',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: spacing),
                                UnderlinedTextField(
                                    obscureText: false,
                                    hintText: 'Registered M-Pesa Name',
                                    controller: mpesaNameTextEditingController),
                                SizedBox(height: spacing),
                                UnderlinedTextField(
                                    obscureText: false,
                                    hintText: 'M-Pesa Phone Number',
                                    controller:
                                        mpesaNumberTextEditingController),
                                SizedBox(height: spacing),
                                CenteredButton(
                                  size: size,
                                  onPressed: openBeneficiary,
                                  child: Text(
                                    'Add Number',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ))
                        : Container(),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    SizedBox(height: 10),
                    CenteredButton(
                      size: size,
                      onPressed: openBeneficiary,
                      child: Text(
                        'Proceed',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
