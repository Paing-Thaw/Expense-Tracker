

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
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color( 0xFF3F51B5),
            secondary: const Color(0xFF00BCD4), // Your accent color
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF212121),
            ),

          )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(id: '01', title: 'Shoe', amount: 300000, date: DateTime.now()),
    // Transaction(id: '02', title: 'Shirt', amount: 50000, date: DateTime.now()),
    // Transaction(id: '03', title: 'Pants', amount: 60000, date: DateTime.now())
  ];

  void _addNewTransaction(String newTitle, int newAmount) {
    final newTransaction = Transaction(
        id: DateTime.now.toString(),
        title: newTitle,
        amount: newAmount,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              child: Text('CHART!'),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const  Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
