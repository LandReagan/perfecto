import 'package:flutter/material.dart';

/// The FlowWidget class give the user a view of the 'Flow' tasks and stories.
///
/// It provides the last 3 tasks and the last 3 stories added in the database.
class FlowWidget extends StatelessWidget {

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 1. Title
        Text('Flow'),
      ],
    );
  }
}