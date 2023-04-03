import 'package:expense_tracker/widgets/user_transactions.dart';

import '/widgets/new_transaction.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Card(
                child: Text('CHART!'),
              ),
              UserTransactions()
            ],
          ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
