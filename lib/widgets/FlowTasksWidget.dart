import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:perfecto/services/FirestoreServices.dart';

import 'package:perfecto/objects/Task.dart';
import 'package:perfecto/widgets/TaskWidget.dart';

/// Shows the last created [numberOfTasks] or 3 flow tasks.
class FlowTasksWidget extends StatelessWidget {

  final int numberOfTasks;

  FlowTasksWidget({number=3}) : numberOfTasks=number;

  // TODO: implement numberOfTasks and Database
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
          .collection(FirestoreServices.flowTasksCollectionPath)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text('Loading...');
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) {
            return TaskWidget(
              Task.fromMap(snapshot.data.documents[index].data),
                snapshot.data.documents[index].documentID
            );
          });
      }
    );
  }
}