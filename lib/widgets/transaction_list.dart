import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 7),
              elevation: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 110,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    decoration: const BoxDecoration(
                        // border: Border(
                        //   right: BorderSide(width: 1, color: Colors.black12),
                        // )
                        border: Border(
                            right:
                                BorderSide(width: 1, color: Colors.black12))),
                    padding: EdgeInsets.all(10.0),
                    child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(children: [
                          TextSpan(
                              text: transactions[index].amount.toString(),
                              style: TextStyle(fontSize: 19)),
                          const TextSpan(
                              text: 'mmk', style: TextStyle(fontSize: 8)),
                        ])),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transactions[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        DateFormat("y MMMM dd ")
                            .add_jm()
                            .format(transactions[index].date),
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: transactions.length,
        ));
  }
}
