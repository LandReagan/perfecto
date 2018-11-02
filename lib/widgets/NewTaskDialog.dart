import 'package:flutter/material.dart';

import 'package:perfecto/objects/Task.dart' show Task;


class NewTaskDialog extends StatefulWidget {
  _NewTaskDialogState createState() => _NewTaskDialogState();
}

class _NewTaskDialogState extends State<NewTaskDialog> {

  Task task = Task('#UNKNOWN#');

  // TODO: move this somewhere else...
  InputDecoration _getTextFieldDecoration(String hint) {
    return InputDecoration(
        hintText: hint,
        border: OutlineInputBorder()
    );
  }

  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Add a task...'),
      children: <Widget>[
        TextField(
          textAlign: TextAlign.center,
          decoration: _getTextFieldDecoration('Task title...'),
        ),
        TextField(
          decoration: _getTextFieldDecoration('Task description (optional)...'),
        ),
        DropdownButton(
          value: task?.status ?? 'To Do',
          items: List.generate(
            Task.STATUS.length,
            (index) {
              return DropdownMenuItem(
                child: Text(Task.STATUS[index]),
                value: Task.STATUS[index],
              );
            }
          ),
          onChanged: (value) {
            setState(() {
              task.status = value;
            });
          },
        )
      ],
    );
  }
}