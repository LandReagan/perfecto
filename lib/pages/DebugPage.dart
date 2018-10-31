import 'package:flutter/material.dart';

import 'package:perfecto/database/Database.dart';


class DebugPage extends StatelessWidget {

  final String text;

  DebugPage(this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debugging page...'),
      ),
      body: Text('...'),
    );
  }
}