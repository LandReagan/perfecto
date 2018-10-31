import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:perfecto/database/Database.dart';
import 'package:perfecto/objects/Task.dart';
import 'package:perfecto/widgets/TaskWidget.dart';


class FlowTasksWidget extends StatelessWidget {

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Database.getFlowTasksStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      }
    );
  }
}