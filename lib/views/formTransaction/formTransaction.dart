import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/forms/editedTextField.dart';
import '../../models/transaction.dart';

class MakeTransfer extends StatelessWidget {
//  MakeTransfer({});

  final String screenName = 'Transfer';
//  final <Object>[] cu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: FormTransaction(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(title: Text(this.screenName),);
  }
}

class FormTransaction extends StatefulWidget {
  FormTransaction({Key key}) : super(key: key);

  @override
  _FormTransactionState createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  GlobalKey<FormState> _formKey;

  TextEditingController _accountController;
  TextEditingController _valueController;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();
    _accountController = TextEditingController();
    _valueController = TextEditingController();
  }

  @override
  void dispose() {
    _accountController.dispose();
    _valueController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Form(
        key: this._formKey,
        child: Column(
          children: <Widget>[
            EditedTextField(
              controller: _accountController,
              label: 'Account Number',
              hint: '0000',
              textInputType: TextInputType.number,
              validator: fieldAccountValidation,
            ),
            EditedTextField(
              controller: _valueController,
              label: 'Value',
              hint: '0.00',
              icon: Icons.monetization_on,
              textInputType: TextInputType.number,
              validator: fieldValueValidation,
            ),
            buildSendButton(onPress: () => sendForm(context)),
          ],
        ),
      ),
    );
  }

  Widget buildSendButton({Function onPress,}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: RaisedButton(
        color: Colors.blueAccent,
        child: Text('Confirm'),
        onPressed: onPress,
      ),
    );
  }

  String fieldAccountValidation(value) {
    if(value.isEmpty) {
      return 'Can\'t be left empty.';
    } else if(int.tryParse(value) == null) {
      return 'Need to be an Integer number';
    }
    return null;
  }

  String fieldValueValidation(value) {
    if(value.isEmpty) {
      return 'Can\'t be left empty.';
    } else if(double.tryParse(value) == null) {
      return 'Need to be an Integer or a number with decimals';
    }
    return null;
  }

  Transaction _createTransactionItem(int numAccount, double value) {
    return Transaction(numAccount, value);
  }

  void sendForm(BuildContext context) {
    if(_formKey.currentState.validate()) {
      final int numAccount = int.tryParse(_accountController.text);
      final double valueTransfer = double.tryParse(_valueController.text);

      Navigator.pop(context, _createTransactionItem(numAccount, valueTransfer));
    }
  }
}


