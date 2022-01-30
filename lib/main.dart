import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Persnoal Expense'),
        ),
        body: Column(
          
          children: [
            Container(
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Text('Chart'),
              ),
            ),
            Card(
              child: Text('List of Tx'),
            ),
          ],
        ));
  }
}
