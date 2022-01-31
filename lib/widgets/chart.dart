import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import '../models/chartData.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  
  double totalSum=0;

  Chart({required this.recentTransactions});

  List<chartData> get groupedTransactionValues {
    return List.generate(7, (index) {

      final weekDay = DateTime.now().subtract(Duration(days: index));

      double amountPerDay = 0;

      for (int i = 0; i < recentTransactions.length; i++) {
        // recentTransactions[i].date==
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          amountPerDay = amountPerDay + recentTransactions[i].amount;

          totalSum=totalSum+amountPerDay;
        }
      }

      return chartData(
          weekDay: DateFormat.E().format(weekDay).substring(0, 1), amountPerDay: amountPerDay);
    });
  }

  double getSpendingPctOfTotal(double amount, double totalSum) {
    return amount/totalSum;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((chartData) {
          return ChartBar(
              label: chartData.weekDay,
              spendingAmount: chartData.amountPerDay,
              spendingPctOfTotal: totalSum == 0 ? 0 : getSpendingPctOfTotal(chartData.amountPerDay, totalSum));
        }).toList(),
      ),
    );
  }
}
