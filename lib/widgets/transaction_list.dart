import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {

  final List<Transaction> transactions = [
    Transaction(id: '01', title: 'Shoe', amount: 300000, date: DateTime.now()),
    Transaction(id: '02', title: 'Shirt', amount: 50000, date: DateTime.now()),
    Transaction(id: '03', title: 'Pants', amount: 60000, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((e) =>
          Card(
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 7),
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 110,
                  margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  decoration: const BoxDecoration(
                    // border: Border(
                    //   right: BorderSide(width: 1, color: Colors.black12),
                    // )
                      border: Border(
                          right: BorderSide(width: 1,
                              color: Colors.black12
                          )
                      )
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan (
                          children: [
                            TextSpan(text: e.amount.toString(), style: TextStyle(fontSize: 19)),
                            const TextSpan (text: 'mmk', style: TextStyle(fontSize: 8)),
                          ]
                      )
                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        e.title,
                        style: const TextStyle( fontWeight: FontWeight.bold,)
                    ),
                    Text(DateFormat("y MMMM dd ").add_jm().format(e.date),
                      style: const TextStyle(color: Colors.grey),)
                  ],
                )
              ],
            ),)
      ).toList(),
    );
  }
}
