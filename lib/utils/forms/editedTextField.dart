import 'package:flutter/material.dart';

class EditedTextField extends StatelessWidget {
  EditedTextField({this.controller, this.label, this.hint, this.textInputType, this.icon, this.validator});

  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType textInputType;
  final IconData icon;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: buildTextFieldDecoration(),
      keyboardType: (textInputType == null) ? TextInputType.text : textInputType,
      controller: controller,
      validator: (value) => ((validator is Function) ? validator(value) : null),
    );
  }

  InputDecoration buildTextFieldDecoration() {
    return InputDecoration(
      icon: (icon == null) ? null : Container(child: Icon(icon), margin: EdgeInsets.fromLTRB(0, 16, 0, 0),),
      labelText: label,
      labelStyle: TextStyle(fontSize: 16),
      hintText: hint,
    );
  }
}