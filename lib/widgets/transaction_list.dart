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
                Container(
                    width: 100,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar( 
                        radius: 40,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: ClipOval(
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: FittedBox(
                              child: Text(
                                  '$kRupeeSymbol${transactions[index].amount.toStringAsFixed(2)}'),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: kTitleTextStyle,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ),
            ),
    );
  }
}
