import '/widgets/new_transaction.dart';
import '/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(id: '01', title: 'Shoe', amount: 300000, date: DateTime.now()),
    Transaction(id: '02', title: 'Shirt', amount: 50000, date: DateTime.now()),
    Transaction(id: '03', title: 'Pants', amount: 60000, date: DateTime.now())
  ];

  void _addNewTransaction (String newTitle, int newAmount) {
    final newTransaction = Transaction(
        id: DateTime.now.toString() ,
        title: newTitle,
        amount: newAmount,
        date: DateTime.now()
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_transactions)
      ],
    );
  }
}
