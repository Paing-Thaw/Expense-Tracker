import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // const NewTransaction({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = int.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 ) {
      return;
    }
    addTransaction(
        enteredTitle,
        enteredAmount
    );
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children:  [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            TextButton(onPressed: () {
              submitData();
            }, child: const Text('Add Transactions'))
          ],
        ),
      ),
    );
  }
}
