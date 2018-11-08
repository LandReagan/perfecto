import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:perfecto/services/Firestore.dart';

import 'package:perfecto/database/Database.dart';
import 'package:perfecto/objects/Task.dart';
import 'package:perfecto/widgets/TaskWidget.dart';


class FlowTasksWidget extends StatelessWidget {

  /*
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Task>>(
      stream: FirestoreServices.getFlowTasksStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text('Loading...');
        print('Task found:' + snapshot.data.toString());
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return TaskWidget(snapshot.data[index]);
          });
      }
    );
  }
  */
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection(FirestoreServices.flowTasksCollectionPath).snapshots(),
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