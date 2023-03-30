import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
   String titleInput = '';
  String amountInput = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              child: Text('CHART!'),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children:  [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      onChanged: (val) => titleInput = val,
                    ),
                    TextField(decoration: InputDecoration(labelText: 'Amount'),
                      onChanged: (val) => amountInput = val,
                    ),
                    TextButton(onPressed: () {
                      print(titleInput);
                      print(amountInput);
                    }, child: Text('Add Transactions'))
                  ],
                ),
              ),
            ),
            TransactionList(),
          ],
        ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
