import 'package:flutter/material.dart';

import 'package:perfecto/objects/Task.dart';


class TaskWidget extends StatefulWidget {

  final Task task;

  TaskWidget(this.task);

  @override
  TaskWidgetState createState() => TaskWidgetState();
}


class TaskWidgetState extends State<TaskWidget> {

  bool _value = false;

  void _taskStateChanged() {
    setState(() {
      _value = !_value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _value,
      title: Text(widget.task.title),
      subtitle: Text(widget.task.description),
      onChanged: (state) {
        _taskStateChanged();
      },
    );
  }
}