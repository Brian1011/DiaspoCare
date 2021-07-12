import 'package:diaspo_care/data/models/transaction_model.dart';
import 'package:diaspo_care/util/time_util.dart';
import 'package:flutter/material.dart';

class TransactionDetailScreen extends StatefulWidget {
  @override
  _TransactionDetailScreenState createState() =>
      _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, TransactionModel> arguments =
        ModalRoute.of(context).settings.arguments;

    TransactionModel transaction = arguments['transaction'];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.black12),
                ),
              ),
              padding: EdgeInsets.only(bottom: 10),
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Transaction ID: ${transaction.transaction.basket}'),
                      Text(
                          'Time: ${transaction.transaction.creation == null ? '' : displayDatesWithTime(transaction.transaction.creation)}'),
                      Text(
                          'Amount: KES ${transaction.transaction.totalAmount}'),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('${transaction.transaction.status}'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Beneficiary',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text('${transaction.parties.beneficiary.user.fullName}'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Pharmacist',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //location was not provided
                // Text('{wekelea Location hapa}'),
                Text('Email: ${transaction.parties.vendor.user.email}'),
                Text(
                    'Phone: ${transaction.parties.vendor.profile.finserveRecipientPhoneNumber}'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Additional Notes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text('{wekelea hapa if they exist}'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Order Basket',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Container(
            //   //TODO: Make height to change according to items in the list
            //   height: size.height * 0.1,
            //   child: ListView.builder(
            //       itemCount: 5,
            //       itemBuilder: (context, index) {
            //         return Row(
            //           children: [
            //             Text('Whatever $index'),
            //             Spacer(),
            //             Text('KES ${1000 * (index + 3 / (index + 1))}')
            //           ],
            //         );
            //       }),
            // ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Text(
                //   'Total   KES {**,***}',
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
