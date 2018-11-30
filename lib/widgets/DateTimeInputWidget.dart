import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeInputWidget extends StatefulWidget {

  final DateTime initialDateTime;

  DateTimeInputWidget(this.initialDateTime);

  _DateTimeInputWidgetState createState() => _DateTimeInputWidgetState();
}

class _DateTimeInputWidgetState extends State<DateTimeInputWidget> {

  DateTime _datetime;

  @override
  void initState() {
    _datetime = widget.initialDateTime;
    super.initState();
  }

  String _getDateString() {
    return _datetime.year.toString() + '-' + _datetime.month.toString() + '-' +
        _datetime.day.toString();
  }

  String _getTimeString() {
    return _datetime.hour.toString() + ':' + _datetime.minute.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Enter date and time...'),
      contentPadding: EdgeInsets.all(10.0),
      children: <Widget>[
        Row(
          children: <Widget>[
            GestureDetector(
              child: Text(_getDateString()),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: _datetime,
                  // TODO: try to do something smarter!
                  firstDate: _datetime.subtract(Duration(days: 10)),
                  lastDate: _datetime.add(Duration(days: 366))
                ).then((datetime) {
                  setState(() {
                    _datetime = datetime;
                  });
                });
              },
            ),
            Spacer(),
            GestureDetector(
              child: Text(_getTimeString()),
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(_datetime)
                ).then((time) {
                  setState(() {
                    _datetime = DateTime(
                      _datetime.year,
                      _datetime.month,
                      _datetime.day,
                      time.hour,
                      time.minute,
                    );
                  });
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
