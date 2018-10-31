import 'package:flutter/material.dart';

import 'package:perfecto/pages/DebugPage.dart';


class HomePageDrawer extends StatelessWidget {

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text("SETTINGS MENU:"),
          ),
          ListTile(
            leading: Icon(Icons.face),
            title: Text('My account'),
          ),
          ListTile(
            leading: Icon(Icons.format_list_numbered),
            title: Text('My stats'),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('My team'),
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('My team stats'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Debugging'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DebugPage('DEBUG')),
              );
            },
          )
        ],
      ),
    );
  }
}