import 'package:flutter/material.dart';

import 'package:perfecto/database/Database.dart';
import 'package:perfecto/objects/Task.dart' show Task;
import 'package:perfecto/widgets/DateTimeInputWidget.dart';


class NewTaskDialog extends StatefulWidget {
  _NewTaskDialogState createState() => _NewTaskDialogState();
}

class _NewTaskDialogState extends State<NewTaskDialog> {

  Task task;
  DateTimeInputWidget dateTimeInputWidget;

  @override
  void initState() {
    super.initState();
    task = Task('#UNKNOWN');
    dateTimeInputWidget = DateTimeInputWidget(DateTime.now());
  }

  void _addTask() {
    task.deadline = dateTimeInputWidget.datetime;
    print('Adding task: ' + task.toMap().toString());
    Database.addNewTask(task);
  }

  // TODO: move this somewhere else...
  InputDecoration _getTextFieldDecoration(String hint) {
    return InputDecoration(
        labelText: hint,
        border: OutlineInputBorder()
    );
  }

  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Add a task...',
          style: TextStyle(fontStyle: FontStyle.italic),),
      contentPadding: EdgeInsets.all(10.0),
      children: <Widget>[
        TextField(
          textAlign: TextAlign.center,
          decoration: _getTextFieldDecoration('Task title...'),
          onChanged: (value) {
            task.title = value.toString();
          },
        ),
        Divider(height: 10.0,),
        TextField(
          decoration: _getTextFieldDecoration('Task description (optional)...'),
          onChanged: (value) {
            task.description = value.toString();
          },
        ),
        Divider(height: 10.0,),
        dateTimeInputWidget,
        Divider(height: 10.0,),
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
        Divider(height: 10.0,),
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
                Navigator.pop(context);
              },
            )
          ],
        )
      ],
    );
  }
}