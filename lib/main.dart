//lec 31
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/add_transaction.dart';
import './widgets/chart.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.cyan),
        fontFamily: 'Quicksand',
        textTheme: TextTheme( 
          // bodyText1: TextStyle(
          //   fontFamily: 'Opensans',
          //   fontSize: 20,
          //   fontWeight: FontWeight.w700,
          // ), 
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Opensans',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 300,
      date: DateTime.now(),
    ),
    // Transaction(
    //   id: 't1',
    //   title: 'Butter Milk',
    //   amount: 15,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 300,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't1',
    //   title: 'Butter Milk',
    //   amount: 15,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 300,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't1',
    //   title: 'Butter Milk',
    //   amount: 15,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 300,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't1',
    //   title: 'Butter Milk',
    //   amount: 15,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 300,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't1',
    //   title: 'Butter Milk',
    //   amount: 15,
    //   date: DateTime.now(),
    // ),
  ];

  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  void _addNewTransaction({required String title, required double amount}) {
    setState(() {
      _transactions.add(
        Transaction(
          id: DateTime.now().toString(),
          title: title,
          amount: amount,
          date: DateTime.now(),
        ),
      );
    });
    Navigator.pop(context);
  }

  void _openAddTransactionSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return AddTransaction(
            titleController: titleController,
            amountController: amountController,
            addNewTransaction: _addNewTransaction,
          );
        });
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7),));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Expense Tracker'),
          actions: [
            IconButton(
              onPressed: () => _openAddTransactionSheet(context),
              icon: Icon(Icons.add),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _openAddTransactionSheet(context),
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Chart(recentTransactions: _recentTransactions,),
            ),
            TransactionList(transactions: _transactions),
          ],
        ),);
  }
}
