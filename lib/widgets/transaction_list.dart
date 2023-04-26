import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Container(
              alignment: Alignment.center,
              child: Text(
                'No Transactions added yet!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                  elevation: 3,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 125,
                        margin: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        decoration: const BoxDecoration(
                            // border: Border(
                            //   right: BorderSide(width: 1, color: Colors.black12),
                            // )
                            border: Border(
                                right: BorderSide(
                                    width: 1, color: Colors.black12))),
                        padding: EdgeInsets.all(10.0),
                        child: Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(children: [
                              TextSpan(
                                text: transactions[index].amount.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              const TextSpan(
                                  text: 'mmk', style: TextStyle(fontSize: 10)),
                            ])),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              DateFormat("y MMMM dd ")
                                  .format(transactions[index].date),
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 5),
                            child: IconButton(
                                onPressed: () => deleteTransaction(transactions[index].id), icon: Icon(Icons.delete)),
                          ),
                        ],
                      ))
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
