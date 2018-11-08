import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeInputWidget extends StatelessWidget {

  final DateTime datetime;

  DateTimeInputWidget(this.datetime);

  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Enter date and time...'),
      contentPadding: EdgeInsets.all(10.0),
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(DateFormat.yMMMd().add_Hm().format(DateTime.now())),
          ],
        ),
      ],
    );
  }
}
