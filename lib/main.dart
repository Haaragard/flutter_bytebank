import 'package:flutter/material.dart';

import 'views/home/home.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bytebank',
      home: Home(),
    );
  }
}