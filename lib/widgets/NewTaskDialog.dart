import 'package:flutter/material.dart';

import 'package:perfecto/objects/Task.dart' show Task;


class NewTaskDialog extends StatefulWidget {
  _NewTaskDialogState createState() => _NewTaskDialogState();
}

class _NewTaskDialogState extends State<NewTaskDialog> {

  Task task = Task('#UNKNOWN#');

  void _addTask() {
    //TODO: link to Database
    print('Adding task: ' + task.toMap().toString());
  }

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
      contentPadding: EdgeInsets.all(10.0),
      children: <Widget>[
        TextField(
          textAlign: TextAlign.center,
          decoration: _getTextFieldDecoration('Task title...'),
          onChanged: (value) {
            task.title = value.toString();
          },
        ),
        TextField(
          decoration: _getTextFieldDecoration('Task description (optional)...'),
          onChanged: (value) {
            task.description = value.toString();
          },
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: DropdownButton(
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
          ),
        ),
        Row(
          children: <Widget>[
            SimpleDialogOption(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Spacer(),
            SimpleDialogOption(
              child: const Text('ADD'),
              onPressed: () {
                _addTask();
              },
            )
          ],
        )
      ],
    );
  }
}