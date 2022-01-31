import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../constants.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    required this.transactions,
  });

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transaction Added Yet!',
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(width: 100, child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,)),
              ],
            )
          : Expanded(
            child: ListView.builder(
              shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              // color: Colors.purple,
                              color: Theme.of(context).colorScheme.primary,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            '$kRupeeSymbol${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactions[index].title,
                              style: kTitleTextStyle,
                            ),
                            Text(
                              DateFormat.yMMMd().format(transactions[index].date),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: transactions.length,
              ),
          ),
    );
  }
}
