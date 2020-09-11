import 'package:flutter/material.dart';

import '../../models/transaction.dart';

import '../formTransaction/formTransaction.dart';
import '../../utils/drawer/drawer.dart';
import '../../utils/widgets/transaction/transactionItem.dart';
import '../../utils/widgets/transaction/transactionList.dart';

class Home extends StatefulWidget {
  final String screenName = 'Home';
  final List<Transaction> _transactions = List();

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: EditedDrawer(),
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingButton(Icons.add, context),
    );
  }

  Widget _buildAppBar() {
    return AppBar(title: Text(widget.screenName),);
  }

  Widget _buildBody() {
    return TransactionsList(widget._transactions);
  }

  Widget _buildFloatingButton(icon, context) {
    return FloatingActionButton(
      child: Icon(icon),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MakeTransfer())
        ).then((transaction) {
          _addTransaction(transaction);
        });
      },
    );
  }

  void _addTransaction(Transaction transaction) {
    if (transaction != null) {
      setState(() {
        widget._transactions.add(transaction);
      });
    }
  }
}



