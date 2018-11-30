import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeInputWidget extends StatefulWidget {

  DateTime datetime;

  DateTimeInputWidget(this.datetime);

  _DateTimeInputWidgetState createState() => _DateTimeInputWidgetState();
}

class _DateTimeInputWidgetState extends State<DateTimeInputWidget> {

  String _getDateString() {
    return widget.datetime.year.toString() + '-' + widget.datetime.month.toString() + '-' +
        widget.datetime.day.toString();
  }

  String _getTimeString() {
    return widget.datetime.hour.toString() + ':' + widget.datetime.minute.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Text(_getDateString()),
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: widget.datetime,
                // TODO: try to do something smarter!
                firstDate: widget.datetime.subtract(Duration(days: 10)),
                lastDate: widget.datetime.add(Duration(days: 366))
              ).then((datetime) {
                setState(() {
                  widget.datetime = datetime;
                });
              });
            },
          ),
          Expanded(child: Center(child: Text(' at '))),
          GestureDetector(
            child: Text(_getTimeString()),
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(widget.datetime)
              ).then((time) {
                setState(() {
                  widget.datetime = DateTime(
                    widget.datetime.year,
                    widget.datetime.month,
                    widget.datetime.day,
                    time.hour,
                    time.minute,
                  );
                });
              });
            },
          ),
        ],
      ),
    );
  }
}
