import 'package:flutter/material.dart';

import 'package:perfecto/widgets/NewTaskDialog.dart';

class DebugPage extends StatelessWidget {

  final String text;

  DebugPage(this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debugging page...'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Trigger a Task input dialog box:'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('New Task dialog showing...');
              showDialog(
                context: context,
                builder: (context) {
                  return NewTaskDialog();
                }
              );
            },
          )
        ],
      )
    );
  }
}