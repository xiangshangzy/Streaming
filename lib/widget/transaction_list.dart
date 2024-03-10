import 'package:flutter/material.dart';

import '../model/Transaction.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<StatefulWidget> createState() => TransactionListState();
}

class TransactionListState extends State<TransactionList> {
  List<Transaction> list = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            child: Container(
                padding: const EdgeInsets.all(10),
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                      controller: _titleController,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Amount',
                      ),
                      controller: _amountController,
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            list.add(Transaction(
                                title: _titleController.text, amount: 9.99));
                          });
                        },
                        child: const Text('Add Transaction')),
                  ],
                ))),
        Container(
          height: 500,
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, index) => Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.purple, width: 2)),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            list[index].amount.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index].title ?? 'title',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(list[index].date.toString(),
                              style: const TextStyle(color: Colors.grey))
                        ],
                      )
                    ],
                  )),
        ),
      ],
    );
  }
}
