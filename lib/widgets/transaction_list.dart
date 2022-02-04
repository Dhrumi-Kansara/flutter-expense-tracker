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
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0), //or 15.0 

                        child: Container(
                          color: Theme.of(context).colorScheme.primary,
                          alignment: Alignment.center,
                          height: 70,
                          width: 70,
                          padding: EdgeInsets.all(6),
                          child: Text(
                            '$kRupeeSymbol${transactions[index].amount.toStringAsFixed(2)}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
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
