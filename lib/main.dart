import '/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';
import 'widgets/transaction_list.dart';
import 'widgets/chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF258EA6),
            secondary: const Color(0xFF549f93), // Your accent color
          ),
          primaryColor: const Color(0xFF258EA6),
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF258EA6),
                ),
                // titleMedium: const TextStyle(
                //   // fontWeight: FontWeight.bold,
                //   fontSize: 25,
                //   color: Color(0xFF258EA6),
                // ),
              )),
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

  List<Transaction> get _recentTransactions {
    return _transactions.where((e) {
      return e.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String newTitle, int newAmount, DateTime chosenDate) {
    final newTransaction = Transaction(
        id: DateTime.now().microsecond.toString(),
        title: newTitle,
        amount: newAmount,
        date: chosenDate);

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

  void deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const Card(
            //   child: Text('CHART!'),
            // ),
            Chart(_recentTransactions),
            TransactionList(_transactions, deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
