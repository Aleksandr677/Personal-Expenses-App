// ignore_for_file: duplicate_import, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/transaction.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: "1", amount: 200, date: DateTime.now(), title: "MyCar"),
    Transaction(id: "2", amount: 100.02, date: DateTime.now(), title: "iPhone"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text("CHART"),
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                  ), 
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                  ),
                  MaterialButton(onPressed: () {}, child: Text("Add Transaction"), textColor: Colors.purple,)
                  ],
              ),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "\$${tx.amount}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(DateFormat.yMMMd().format(tx.date),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.grey))
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
