import 'package:flutter/material.dart';

import 'package:perfecto/objects/Task.dart';


class TaskWidget extends StatefulWidget {

  final Task task;
  final String databaseTaskId;

  TaskWidget(this.task, this.databaseTaskId);

  @override
  TaskWidgetState createState() => TaskWidgetState();
}


class TaskWidgetState extends State<TaskWidget> {

  Task _changedTask;

  @override
  void initState() {
    _changedTask = widget.task;
    super.initState();
  }

  void _changeStatus(bool state) {
    if (!state) {
      _changedTask.status = 'To Do';
    } else {
      _changedTask.status = 'Done';
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _changedTask.status == 'Done',
      title: Text(_changedTask.title),
      subtitle: _changedTask.description == null ? Text('') : Text(_changedTask.description),
      onChanged: (state) {
        _changeStatus(state);
      },
    );
  }
}