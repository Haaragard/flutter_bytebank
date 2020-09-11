import 'package:flutter/material.dart';

import '../../../models/transaction.dart';
import 'transactionItem.dart';

class TransactionsList extends StatelessWidget {
  TransactionsList(_transactions);

  final List<Transaction> _transactions = List();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _transactions.length,
      itemBuilder: (context, index) {
        return TransactionItem(
            _transactions[index].accountNumber,
            _transactions[index].value,
            Icon(Icons.monetization_on)
        );
      },
    );
  }
}
