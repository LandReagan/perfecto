import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:perfecto/database/Database.dart';
import 'package:perfecto/objects/Task.dart';
import 'package:perfecto/widgets/TaskWidget.dart';


class FlowTasksWidget extends StatefulWidget {

  FlowTasksWidgetState createState() => FlowTasksWidgetState();
}


class FlowTasksWidgetState extends State<FlowTasksWidget> {

  List<Task> tasks = [];

  void updateTasks() async {
    tasks = await Database.getFlowTasks();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    if (tasks.isEmpty) return Text('Loading...');

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, item) {
        TaskWidget(tasks[item]);
      }
    );
  }
}