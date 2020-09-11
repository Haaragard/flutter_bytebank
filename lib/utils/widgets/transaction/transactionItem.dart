import 'package:flutter/material.dart';
import '../../../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  TransactionItem(this._accountNumber, this._value, this._icon);

  final Widget _icon;
  final double _value;
  final int _accountNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(child: this._icon, margin: EdgeInsets.fromLTRB(0, 8, 0, 0),),
        title: Text('${this._value}'),
        subtitle: Text('${this._accountNumber}'),
      ),
    );
  }
}