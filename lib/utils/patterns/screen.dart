import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  Screen({Key key, @required this.screenName, this.body});

  final String screenName;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: (body == null) ? _buildBody() : body,
    );
  }

  Widget _buildAppBar() {
    return AppBar( title: Text(screenName), );
  }

  Widget _buildBody() {
    return Center(child: Text('$screenName screen'),);
  }
}