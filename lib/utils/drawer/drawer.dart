import 'package:flutter/material.dart';

class EditedDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _buildHeader(),
          _buildMenuButton(icon: Icons.home, screenName: 'Home', enabled: true, action: () => debugPrint('Foi pra Home carai')),
          _buildMenuButton(icon: Icons.attach_money, screenName: 'Transfer', enabled: true, action: () => debugPrint('Foi pra Transações carai')),
//          _buildMenuButton(),
//          _buildMenuButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 100,
      child: DrawerHeader(
        child: Text('Drawer Header'),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildMenuButton({IconData icon, String screenName, Function action, bool enabled: false}) {
    return Card(
      child: ListTile(
        onTap: action,
        leading: (icon == null) ? null : Icon(icon),
        title: Text((screenName == null) ? '' : screenName),
        enabled: enabled,
      ),
    );
  }
}
