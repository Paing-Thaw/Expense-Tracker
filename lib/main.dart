import 'package:flutter/material.dart';
import 'transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(id: '01', title: 'Shoe', amount: 300000, date: DateTime.now()),
    Transaction(id: '02', title: 'Shirt', amount: 50000, date: DateTime.now()),
    Transaction(id: '03', title: 'Pants', amount: 60000, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Card(
                child: Text('CHART!'),
              ),
            ),
            Column(
              children: transactions.map((e) =>
                  Card(child: Row(
                    children: [
                      Text(e.amount.toString()),
                      Column(
                        children: [
                          Text(e.title),
                          Text(e.date.toString())
                        ],
                      )
                    ],
                  ),)
              ).toList(),
            )
          ],
        ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
