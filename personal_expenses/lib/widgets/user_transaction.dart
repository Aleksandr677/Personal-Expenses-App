import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

final List<Transaction> _userTransaction = [

];

void _addNewTransaction(String title, double amount) {
final newTX = Transaction(
  id: DateTime.now().toString(), 
  amount: amount, 
  date: DateTime.now(), 
  title: title);

  setState(() {
    _userTransaction.add(newTX);
  });
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        NewTransaction(_addNewTransaction), 
        TransactionList(_userTransaction)
      ],
    );
  }
}
